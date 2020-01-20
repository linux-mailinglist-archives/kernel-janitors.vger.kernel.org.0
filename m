Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E914298D
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jan 2020 12:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgATLcd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 06:32:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50335 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726752AbgATLcd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 06:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579519952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H9SYcfz1oePHF0++rlV1xUZ6OF7Ac6ASAIkjSA5Z3T4=;
        b=EVJd1By10FuDwejzDgKprjIYGqAry30N1y+DzfqNperG3lsvrC/ZsS6OI+RH3tNvNwWLQ8
        +8MN6JsxnGpcJdI+QpxqpSHSZ0+Tj9Rbz9C/LQxijfWnetFPRSdreJTroHhqNZd1gx9C6N
        CruGk3QQZO6SzOYQHmyuitxqP+Oft7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-pJN7XweONy2WmwNrjbK5cw-1; Mon, 20 Jan 2020 06:32:31 -0500
X-MC-Unique: pJN7XweONy2WmwNrjbK5cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C34107ACC4;
        Mon, 20 Jan 2020 11:32:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com [10.10.120.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AADFA8BE0D;
        Mon, 20 Jan 2020 11:32:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200120085411.116252-1-weiyongjun1@huawei.com>
References: <20200120085411.116252-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     dhowells@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] watch_queue: Fix error return code in watch_queue_set_size()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <771478.1579519948.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 20 Jan 2020 11:32:28 +0000
Message-ID: <771479.1579519948@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

>  	pages =3D kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
> -	if (!pages)
> +	if (!pages) {
> +		ret =3D -ENOMEM;

I think the preferred method would be to set ret before calling kcalloc as=
 the
attached.

David
---

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 8c625cf451e6..a11724d66834 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -249,6 +249,7 @@ long watch_queue_set_size(struct pipe_inode_info *pipe=
, unsigned int nr_notes)
 	if (ret < 0)
 		goto error;
 =

+	ret =3D -ENOMEM;
 	pages =3D kcalloc(sizeof(struct page *), nr_pages, GFP_KERNEL);
 	if (!pages)
 		goto error;

