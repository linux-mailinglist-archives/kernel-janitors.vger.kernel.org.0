Return-Path: <kernel-janitors+bounces-1119-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11137826A3D
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 10:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7BB6B21B62
	for <lists+kernel-janitors@lfdr.de>; Mon,  8 Jan 2024 09:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78243E543;
	Mon,  8 Jan 2024 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmV1m/Wb"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6EA11C89
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jan 2024 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d41555f9dso18836735e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jan 2024 01:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704704883; x=1705309683; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UdLGAH7mAUfR9yXCWKCpw7UbYKtkDbnESY38vkxFL4=;
        b=GmV1m/WbhAuWKZBuQUCrM38Vy2EfZ+ZwlfLs6grsa7lT3HmuXwtXJE8Ahl9rxEWdC5
         jaIEPTJRN56d74qbnpDwx4xoFJmut1Rz6Lo5P7q2q3iCMp+9309328VEG0YnRn+QLP1+
         02buYXqbbkrtboWa6tzh0/inTqmq4ek4Emr5+bIfQycpJ53XwX+V/g2FsEsao/4eGvqv
         5au+TdA6IrOXlbBhXgnZ/SxH0qUchIZWNq7nnbKYJBge/x3S3SlpnGJlPl0DjWY7mROP
         8DfV43S5Pplu/Dl+XPLynpT/qJMASIrk9qrMC4TUyIkvB1w/zC36yVrYCRoZqRH1NFAi
         bUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704704883; x=1705309683;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UdLGAH7mAUfR9yXCWKCpw7UbYKtkDbnESY38vkxFL4=;
        b=vBlLTaXeVK/FykD+WUYBSU/SZZo0feZRXOk+X9Jz2zcyO94GttEe3khYMbt7r+btiF
         S1KAIRCCp0xEJDL6sOLp6RTooz6s4qXuC49RJwNukMMReOQVPvqyB9xPHBunEa2Dos3O
         AMePvUDpGjJ/TX4h3whLpbL7O08ps9PVWsVgo5q6+S59wCY4OeNt/b0zqdGC+2503O6e
         jo9str6kmuytibmZsKtaxLP4VTffQIKqVmeCby0kcqTIK+tpjXmvcBjntTCBDPr0sGUe
         PS/BegcMv5PKmvUJ409ojHeYJvLo4/2qJEXwnrTVBZiHZtg/+W2QK7ILS7t8yB8Nss4l
         ltgw==
X-Gm-Message-State: AOJu0YwpBR4Pg1QWSFmZ1dWVqFt4kTyiSLIAAurx7VJ/N5VMxP6Wqsme
	btg3pnnubqOizjADY8QITWScSTBOfOLgpg==
X-Google-Smtp-Source: AGHT+IGR9C1sN5I4JwnlQfEbHvH3L7omqSa/7b+RgytNY22CW/mp0f3Tji6ueqGkBmSbtXxql7dBKg==
X-Received: by 2002:a7b:cb8f:0:b0:40e:47a3:5e1d with SMTP id m15-20020a7bcb8f000000b0040e47a35e1dmr470518wmi.156.1704704882913;
        Mon, 08 Jan 2024 01:08:02 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l42-20020a05600c1d2a00b004030e8ff964sm10295482wms.34.2024.01.08.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 01:08:02 -0800 (PST)
Date: Mon, 8 Jan 2024 12:07:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steve French <sfrench@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3] cifs: delete unnecessary NULL checks in
 cifs_chan_update_iface()
Message-ID: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We return early if "iface" is NULL so there is no need to check here.
Delete those checks.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/sess.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
index a16e175731eb..775c6a4a2f4b 100644
--- a/fs/smb/client/sess.c
+++ b/fs/smb/client/sess.c
@@ -467,27 +467,23 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
 		kref_put(&old_iface->refcount, release_iface);
 	} else if (!chan_index) {
 		/* special case: update interface for primary channel */
-		if (iface) {
-			cifs_dbg(FYI, "referencing primary channel iface: %pIS\n",
-				 &iface->sockaddr);
-			iface->num_channels++;
-			iface->weight_fulfilled++;
-		}
+		cifs_dbg(FYI, "referencing primary channel iface: %pIS\n",
+			 &iface->sockaddr);
+		iface->num_channels++;
+		iface->weight_fulfilled++;
 	}
 	spin_unlock(&ses->iface_lock);
 
-	if (iface) {
-		spin_lock(&ses->chan_lock);
-		chan_index = cifs_ses_get_chan_index(ses, server);
-		if (chan_index == CIFS_INVAL_CHAN_INDEX) {
-			spin_unlock(&ses->chan_lock);
-			return 0;
-		}
-
-		ses->chans[chan_index].iface = iface;
+	spin_lock(&ses->chan_lock);
+	chan_index = cifs_ses_get_chan_index(ses, server);
+	if (chan_index == CIFS_INVAL_CHAN_INDEX) {
 		spin_unlock(&ses->chan_lock);
+		return 0;
 	}
 
+	ses->chans[chan_index].iface = iface;
+	spin_unlock(&ses->chan_lock);
+
 	return rc;
 }
 
-- 
2.42.0


