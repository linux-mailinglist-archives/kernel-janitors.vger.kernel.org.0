Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC761AB1C
	for <lists+kernel-janitors@lfdr.de>; Sun, 12 May 2019 09:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfELHpw (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 12 May 2019 03:45:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53674 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfELHpw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 12 May 2019 03:45:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4921D81F1B;
        Sun, 12 May 2019 07:45:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com [10.10.120.61])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F95F5D9C6;
        Sun, 12 May 2019 07:45:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
From:   David Howells <dhowells@redhat.com>
To:     colin.king@canonical.com
Cc:     joe@perches.com, jaltman@auristor.com,
        linux-afs@lists.infradead.org, dhowells@redhat.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 12 May 2019 08:45:48 +0100
Message-ID: <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
In-Reply-To: <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
References: <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sun, 12 May 2019 07:45:51 +0000 (UTC)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

afs_xattr_get_yfs() tries to free yacl, which may hold an error value (say
if yfs_fs_fetch_opaque_acl() failed and returned an error).

Fix this by allocating yacl up front (since it's a fixed-length struct,
unlike afs_acl) and passing it in to the RPC function.  This also allows
the flags to be placed in the object rather than passing them through to
the RPC function.

Fixes: ae46578b963f ("afs: Get YFS ACLs and information through xattrs")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h  |    2 +
 fs/afs/xattr.c     |   86 ++++++++++++++++++++++++++++------------------------
 fs/afs/yfsclient.c |   29 ++++--------------
 3 files changed, 53 insertions(+), 64 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index b3cd6e8ad59d..74ee0f8ef8dd 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1382,7 +1382,7 @@ struct yfs_acl {
 };
 
 extern void yfs_free_opaque_acl(struct yfs_acl *);
-extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, unsigned int);
+extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, struct yfs_acl *);
 extern int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *, const struct afs_acl *);
 
 /*
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index b6c44e75b361..d12bcda911e1 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -148,9 +148,8 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct yfs_acl *yacl = NULL;
 	struct key *key;
-	unsigned int flags = 0;
 	char buf[16], *data;
-	int which = 0, dsize, ret;
+	int which = 0, dsize, ret = -ENOMEM;
 
 	if (strcmp(name, "acl") == 0)
 		which = 0;
@@ -163,20 +162,26 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 	else
 		return -EOPNOTSUPP;
 
+	yacl = kzalloc(sizeof(struct yfs_acl), GFP_KERNEL);
+	if (!yacl)
+		goto error;
+
 	if (which == 0)
-		flags |= YFS_ACL_WANT_ACL;
+		yacl->flags |= YFS_ACL_WANT_ACL;
 	else if (which == 3)
-		flags |= YFS_ACL_WANT_VOL_ACL;
+		yacl->flags |= YFS_ACL_WANT_VOL_ACL;
 
 	key = afs_request_key(vnode->volume->cell);
-	if (IS_ERR(key))
-		return PTR_ERR(key);
+	if (IS_ERR(key)) {
+		ret = PTR_ERR(key);
+		goto error_yacl;
+	}
 
 	ret = -ERESTARTSYS;
 	if (afs_begin_vnode_operation(&fc, vnode, key)) {
 		while (afs_select_fileserver(&fc)) {
 			fc.cb_break = afs_calc_vnode_cb_break(vnode);
-			yacl = yfs_fs_fetch_opaque_acl(&fc, flags);
+			yfs_fs_fetch_opaque_acl(&fc, yacl);
 		}
 
 		afs_check_for_remote_deletion(&fc, fc.vnode);
@@ -184,44 +189,45 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
 		ret = afs_end_vnode_operation(&fc);
 	}
 
-	if (ret == 0) {
-		switch (which) {
-		case 0:
-			data = yacl->acl->data;
-			dsize = yacl->acl->size;
-			break;
-		case 1:
-			data = buf;
-			dsize = snprintf(buf, sizeof(buf), "%u",
-					 yacl->inherit_flag);
-			break;
-		case 2:
-			data = buf;
-			dsize = snprintf(buf, sizeof(buf), "%u",
-					 yacl->num_cleaned);
-			break;
-		case 3:
-			data = yacl->vol_acl->data;
-			dsize = yacl->vol_acl->size;
-			break;
-		default:
-			ret = -EOPNOTSUPP;
-			goto out;
-		}
+	if (ret < 0)
+		goto error_key;
+
+	switch (which) {
+	case 0:
+		data = yacl->acl->data;
+		dsize = yacl->acl->size;
+		break;
+	case 1:
+		data = buf;
+		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
+		break;
+	case 2:
+		data = buf;
+		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
+		break;
+	case 3:
+		data = yacl->vol_acl->data;
+		dsize = yacl->vol_acl->size;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto error_key;
+	}
 
-		ret = dsize;
-		if (size > 0) {
-			if (dsize > size) {
-				ret = -ERANGE;
-				goto out;
-			}
-			memcpy(buffer, data, dsize);
+	ret = dsize;
+	if (size > 0) {
+		if (dsize > size) {
+			ret = -ERANGE;
+			goto error_key;
 		}
+		memcpy(buffer, data, dsize);
 	}
 
-out:
-	yfs_free_opaque_acl(yacl);
+error_key:
 	key_put(key);
+error_yacl:
+	yfs_free_opaque_acl(yacl);
+error:
 	return ret;
 }
 
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 6cf7d161baa1..d3e9e3fe0b58 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -2333,12 +2333,6 @@ void yfs_free_opaque_acl(struct yfs_acl *yacl)
 	}
 }
 
-static void yfs_destroy_fs_fetch_opaque_acl(struct afs_call *call)
-{
-	yfs_free_opaque_acl(call->reply[0]);
-	afs_flat_call_destructor(call);
-}
-
 /*
  * YFS.FetchOpaqueACL operation type
  */
@@ -2346,18 +2340,17 @@ static const struct afs_call_type yfs_RXYFSFetchOpaqueACL = {
 	.name		= "YFS.FetchOpaqueACL",
 	.op		= yfs_FS_FetchOpaqueACL,
 	.deliver	= yfs_deliver_fs_fetch_opaque_acl,
-	.destructor	= yfs_destroy_fs_fetch_opaque_acl,
+	.destructor	= afs_flat_call_destructor,
 };
 
 /*
  * Fetch the YFS advanced ACLs for a file.
  */
 struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
-					unsigned int flags)
+					struct yfs_acl *yacl)
 {
 	struct afs_vnode *vnode = fc->vnode;
 	struct afs_call *call;
-	struct yfs_acl *yacl;
 	struct afs_net *net = afs_v2net(vnode);
 	__be32 *bp;
 
@@ -2370,19 +2363,15 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
 				   sizeof(__be32) * 2 +
 				   sizeof(struct yfs_xdr_YFSFetchStatus) +
 				   sizeof(struct yfs_xdr_YFSVolSync));
-	if (!call)
-		goto nomem;
-
-	yacl = kzalloc(sizeof(struct yfs_acl), GFP_KERNEL);
-	if (!yacl)
-		goto nomem_call;
+	if (!call) {
+		fc->ac.error = -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+	}
 
-	yacl->flags = flags;
 	call->key = fc->key;
 	call->reply[0] = yacl;
 	call->reply[1] = vnode;
 	call->reply[2] = NULL; /* volsync */
-	call->ret_reply0 = true;
 
 	/* marshall the parameters */
 	bp = call->request;
@@ -2396,12 +2385,6 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
 	trace_afs_make_fs_call(call, &vnode->fid);
 	afs_make_call(&fc->ac, call, GFP_KERNEL);
 	return (struct yfs_acl *)afs_wait_for_call_to_complete(call, &fc->ac);
-
-nomem_call:
-	afs_put_call(call);
-nomem:
-	fc->ac.error = -ENOMEM;
-	return ERR_PTR(-ENOMEM);
 }
 
 /*

