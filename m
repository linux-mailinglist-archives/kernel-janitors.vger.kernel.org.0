Return-Path: <kernel-janitors+bounces-1121-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0573826A4A
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 10:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3C721C22066
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D572812B93;
	Mon,  8 Jan 2024 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFGpGo04"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2111173A
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jan 2024 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso18527455e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jan 2024 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704704971; x=1705309771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpH6e5f9CwrQldKdZ83I+BJ56xcegVaU/llwUYD/L+Y=;
        b=AFGpGo04OG/UOdW/snZ+nSH+V0RLndPg+hnfmBW/LftAEgeD8U83ltQRl/n5E+96ma
         /t+XAI8hB6bYwEmrjIaO58DOmJueYfsBpr1Qy2vQfQ98wPBjYv1gCep/+9KGUFEqxgty
         ZDitpY3n8SsYkUcN4GlzvUQVsLldYNNE14D1jgoVdP0zADqR1rb4j+/kBZasBl9v5JTJ
         Cx4vV+Ehux6dCDA6+hF7dJwfWyXJogtGnRlsIRwT5O9h072AnUwTE+1u9FkYLz6yo8Gc
         lk0d+VcdbhLE2s9hVwpJYR02vFqiF4sL6je8xkonDc1ClRJtYIt0tgDzEOha8G9qtbjX
         Li0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704704971; x=1705309771;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpH6e5f9CwrQldKdZ83I+BJ56xcegVaU/llwUYD/L+Y=;
        b=iy5Pi5C2U2Sa46QaK9Sx+99NfEE1ulOxwEDQFvhP0mVteWv7oI0ejKqns/XE3qvg4Q
         ePCd5tQCHsXjKjvY4KPnBb8B2Nw9+sfn8JAImqtDizDjEZ6LRHGl/5M1BukNHorUF5nj
         rxoCImpVIJnAcNGIJihg+1IglE+4Hh8CQQmyHv5g0I74mgi8T+T6Muoe49QLcTVDubh0
         AmvhIAJj6s8N1Wq2v9HZnWphV4JZp3YE4oUkBvD1qErR2ZFP2cyJdgnqedd3dk/tYw+W
         Ee1GBOzikw7WqMDau4bjVHW0Zz1Brn6PnZ/suFmg7yO6g2JTbLaKbHgQBnFGqriTblu+
         62/g==
X-Gm-Message-State: AOJu0YwrSow283BHZCxmJ2mOcbHkKZkh02vKdHBsu6Qa0hQb5o0U4KYB
	q3syhwtWE3FsyXh57li/WOHvVE5D7eh8FQ==
X-Google-Smtp-Source: AGHT+IFAWLQ1wAIfuj8nS99qhKD77kxRlCvb4NjoLF3gKRyK3iywjpF/YFgt0Qpj5Po/c+PM2OoGGA==
X-Received: by 2002:a05:600c:1d24:b0:40d:83e1:6c62 with SMTP id l36-20020a05600c1d2400b0040d83e16c62mr1798205wms.7.1704704971098;
        Mon, 08 Jan 2024 01:09:31 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id n43-20020a05600c502b00b0040e45799541sm3892170wmr.15.2024.01.08.01.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 01:09:30 -0800 (PST)
Date: Mon, 8 Jan 2024 12:09:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steve French <sfrench@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] cifs: simplify a check in cifs_chan_update_iface()
Message-ID: <eef8b278-97b5-4858-b05f-5cfc454cc614@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
X-Mailer: git-send-email haha only kidding

The loop iterator in a list_for_each() loop is never NULL at the end.
This condition uses a two step process of setting the iterator, "iface",
from non-NULL to NULL and then checking if it's NULL.  It's easier to do
in one step.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/sess.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
index f7b216dd06b2..987188e1929e 100644
--- a/fs/smb/client/sess.c
+++ b/fs/smb/client/sess.c
@@ -363,7 +363,7 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
 {
 	unsigned int chan_index;
 	size_t iface_weight = 0, iface_min_speed = 0;
-	struct cifs_server_iface *iface = NULL;
+	struct cifs_server_iface *iface;
 	struct cifs_server_iface *old_iface = NULL;
 	struct cifs_server_iface *last_iface = NULL;
 	struct sockaddr_storage ss;
@@ -432,11 +432,6 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
 	}
 
 	if (list_entry_is_head(iface, &ses->iface_list, iface_head)) {
-		iface = NULL;
-		cifs_dbg(FYI, "unable to find a suitable iface\n");
-	}
-
-	if (!iface) {
 		if (!chan_index)
 			cifs_dbg(FYI, "unable to get the interface matching: %pIS\n",
 				 &ss);
-- 
2.42.0


