Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE273AAC81
	for <lists+kernel-janitors@lfdr.de>; Thu, 17 Jun 2021 08:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFQGkF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 17 Jun 2021 02:40:05 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4823 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhFQGkE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 02:40:04 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5C0h57Q1zXgkx;
        Thu, 17 Jun 2021 14:32:52 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:37:54 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Jun
 2021 14:37:54 +0800
From:   Baokun Li <libaokun1@huawei.com>
To:     <libaokun1@huawei.com>, Namjae Jeon <namjae.jeon@samsung.com>,
        "Sergey Senozhatsky" <sergey.senozhatsky@gmail.com>,
        Steve French <sfrench@samba.org>,
        Hyunchul Lee <hyc.lee@gmail.com>
CC:     <linux-cifs@vger.kernel.org>,
        <linux-cifsd-devel@lists.sourceforge.net>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] cifsd: fix WARNING: convert list_for_each to entry variant in smb2pdu.c
Date:   Thu, 17 Jun 2021 14:46:53 +0800
Message-ID: <20210617064653.3193618-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

convert list_for_each() to list_for_each_entry() where
applicable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/cifsd/smb2pdu.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/cifsd/smb2pdu.c b/fs/cifsd/smb2pdu.c
index ac15a9287310..22ef1d9eed1b 100644
--- a/fs/cifsd/smb2pdu.c
+++ b/fs/cifsd/smb2pdu.c
@@ -74,10 +74,7 @@ static inline int check_session_id(struct ksmbd_conn *conn, u64 id)
 struct channel *lookup_chann_list(struct ksmbd_session *sess)
 {
 	struct channel *chann;
-	struct list_head *t;
-
-	list_for_each(t, &sess->ksmbd_chann_list) {
-		chann = list_entry(t, struct channel, chann_list);
+	list_for_each_entry(chann, &sess->ksmbd_chann_list, chann_list) {
 		if (chann && chann->conn == sess->conn)
 			return chann;
 	}
@@ -6258,7 +6255,6 @@ int smb2_cancel(struct ksmbd_work *work)
 	struct smb2_hdr *hdr = work->request_buf;
 	struct smb2_hdr *chdr;
 	struct ksmbd_work *cancel_work = NULL;
-	struct list_head *tmp;
 	int canceled = 0;
 	struct list_head *command_list;
 
@@ -6269,9 +6265,8 @@ int smb2_cancel(struct ksmbd_work *work)
 		command_list = &conn->async_requests;
 
 		spin_lock(&conn->request_lock);
-		list_for_each(tmp, command_list) {
-			cancel_work = list_entry(tmp, struct ksmbd_work,
-						 async_request_entry);
+		list_for_each_entry(cancel_work, command_list,
+				    async_request_entry) {
 			chdr = cancel_work->request_buf;
 
 			if (cancel_work->async_id !=
@@ -6290,9 +6285,7 @@ int smb2_cancel(struct ksmbd_work *work)
 		command_list = &conn->requests;
 
 		spin_lock(&conn->request_lock);
-		list_for_each(tmp, command_list) {
-			cancel_work = list_entry(tmp, struct ksmbd_work,
-						 request_entry);
+		list_for_each_entry(cancel_work, command_list, request_entry) {
 			chdr = cancel_work->request_buf;
 
 			if (chdr->MessageId != hdr->MessageId ||

