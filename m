Return-Path: <kernel-janitors+bounces-1542-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01B84573B
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Feb 2024 13:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E64828242A
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Feb 2024 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF6B15DBB9;
	Thu,  1 Feb 2024 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wcuTGGCd"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6C15DBA4
	for <kernel-janitors@vger.kernel.org>; Thu,  1 Feb 2024 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789939; cv=none; b=awghmch0/nwpFGgr9Q/EAfdDVxBLiZP03GfO8aPYe+x/2s9k5mW3AKnaGmYkD7cmFWqJXO608BSxPBI4ANFjDLpm72pv6bkcU+oJIO4FybKsXcGqhTKyTGlrxZizsKpr3e2frPnvJOUZJTSU4BPmzTf1sfpNtu8jAezj8eBKlHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789939; c=relaxed/simple;
	bh=0u6CPpAAjikGWkMcjodbvpI7eJQQxDmT7SnkrkSi7S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elpTFhlNQFtzml0q1BxXzFtOfxqtWZ1C9l28x/Rggc+OqxZLeHf+4Nl5PSXFru3ntRbY6jlw9DJkUWcyKg5ry7Za3PXF6T3+F2qAWDAR9TgI3iS/4MimsrVDohC8P8mXFIfuKtXxwCPF9y5FO7rA+RJQe2lEK2WFPgPXj0o8pzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wcuTGGCd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a293f2280c7so110760266b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Feb 2024 04:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706789936; x=1707394736; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxKM8B/+4uxDJuVV6uI4MZb9Fe6fGclb+oWzaAjZwbg=;
        b=wcuTGGCd7KHQFMh15xHt52CWUf8IG/oO/bFEKZjHnFRrfnA/1KG2r6BoJHNLRa0WKb
         dbSur/MUTkW4zyJ9wkOcPd1DyrZHEdunYokX4/Z+w0uBk/SwrVjaA6a8mAKQKSLEtDUm
         8M0hM7DcuYQ9dBY7hsm8Z09PBcDbm79zUoX84mG7QRzvq0HcXsl0oveNlH8wj7fZvWS3
         bhydJ1TjykGGGB+YcSA3yXLf4c/WHKq27teuZPH50Vipv/f5+2pRUANZQUoJHu6DgQNT
         +GpWcjouTYRpLveiSitHNjIu1jPbbetsWAIc3C5wOaSsrEQyiGQuVmGlFeiTx/RlKpuZ
         yX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789936; x=1707394736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxKM8B/+4uxDJuVV6uI4MZb9Fe6fGclb+oWzaAjZwbg=;
        b=l6tIgtXylPzTGH/78A5HowvgFWTfQLs1aYlr/zyQeZSOtESSbvfHSDwxVag3/fv16o
         8Z49loLsR8TgXkGjHo2b+7SSn+NUaAljd+oORRkoLe37jOgYU9DnAuQaMNtmS5c9mXh7
         3po0K+IzMmLLckOjCBZwE5ANwTvfFcR87lTxXM6YKWg8d0YHRI8AWzntqPfP8AZiOafU
         DxJCOjmJYBgFkV21o8j3JDcqjXG/+PB6C6hzOAdRAVupe8i9BNmy7WL4MRLVnJj9dKFG
         92rOqawX644rzfL+1VDP1JEgtwSgAKCb7pqHzpSyDGjcAYdUAoBvXnHrqaN8m1gJ1ETr
         ydSw==
X-Gm-Message-State: AOJu0Yz9TdKpoi79gZWLbbXRPIFfdMdktjtq75eZ2Ktoj8Nrv9Hq0gMH
	eRFoQiqVsWJNlnpZkbyTI8KibZr5RakuOfT2oB3aD5KP8uQGf/Yto7DXXpApAlQ=
X-Google-Smtp-Source: AGHT+IHqio1K2v4vG6WifOFqQbnp6NNXN3nUmPKstb3Bh6hAXEkf1XIqP2kKhvVoaKMBDGuWSm9xFQ==
X-Received: by 2002:a17:906:4ec1:b0:a30:b47:b626 with SMTP id i1-20020a1709064ec100b00a300b47b626mr3459192ejv.35.1706789935736;
        Thu, 01 Feb 2024 04:18:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWhiYEyqdGIGJMv+e9C8Q6+387DAMQBjdrXrjTP7/sLkqF260wnCrmJ8XbnG53BpkG2kJSird5Evpn0AkAEcKChG9uk/BJWV0zDR2XU+RPKBew/s4iFw88ddPX2Xax3fLbBffXOyaiGaAP8COSWaQSNfOo5GpW5dYEBcLde/9Gq8vzJDIfrAz9tvQrDPgKcMLaqaG2YVIuoScE6Yi0mEcND6u+wwYd93sqB6xK7vzdq0393OHif5uTeqZDqFBpr6fR8tRLdn0fklSjFQHK8cCMF+rwdIlCdoOjIc6o6uwE8
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id wb12-20020a170907d50c00b00a369b47996esm1013203ejc.80.2024.02.01.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 04:18:55 -0800 (PST)
Date: Thu, 1 Feb 2024 15:18:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] smb: client: Fix a double lock bug in smb2_reconnect()
Message-ID: <bf90de00-4d6a-4440-b6a1-42ac9e358158@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This goto will try to lock spin_lock(&ses->ses_lock) twice which will
lead to a deadlock.

Fixes: 17525952fa83 ("cifs: make sure that channel scaling is done only once")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/smb2pdu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 2837fc4465a7..dcd3f6f08c7f 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -401,7 +401,7 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon *tcon,
 
 	spin_lock(&ses->ses_lock);
 	if (ses->flags & CIFS_SES_FLAG_SCALE_CHANNELS)
-		goto skip_add_channels;
+		goto skip_add_channels_locked;
 	ses->flags |= CIFS_SES_FLAG_SCALE_CHANNELS;
 	spin_unlock(&ses->ses_lock);
 
@@ -448,6 +448,7 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon *tcon,
 
 skip_add_channels:
 	spin_lock(&ses->ses_lock);
+skip_add_channels_locked:
 	ses->flags &= ~CIFS_SES_FLAG_SCALE_CHANNELS;
 	spin_unlock(&ses->ses_lock);
 
-- 
2.43.0


