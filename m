Return-Path: <kernel-janitors+bounces-1525-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA0843770
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jan 2024 08:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F811C2433A
	for <lists+kernel-janitors@lfdr.de>; Wed, 31 Jan 2024 07:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD695DF23;
	Wed, 31 Jan 2024 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPs80czN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C1378694
	for <kernel-janitors@vger.kernel.org>; Wed, 31 Jan 2024 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685024; cv=none; b=LXOcSJ0PTZ92AfGUPJX+XmD1i1QM+qHGXojIShpVwx+tggJt0xVDRnEtGaayfQxB3SHbc4M3ny5+Vfqx/X7ixv8V94+j05hv/BnDcThk6jxVFDqJBTkxLpmn9qC3zWgUNaFDMO4AKi2JYJ1TmZ5bqiH2GMuIU0DgrpKROEblwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685024; c=relaxed/simple;
	bh=64+50SEu7bMaznhj+tfj6rGm3p7Mn6Ou6pGwTLtkJU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBVbOSKhfDzNA5ctm6NGMXWjnYUSyPHy8j2LSmsFjvjTX/leUkz0RzsWsqoNJduubT8uObBoidjnr8KrWE97YJl0xTHwtoo+kIN+Js6cM2JxDwcjnhDqHMtkTNgJQDjAhcPIQmMdQtNlpEgle4DC4KGD9YVBE8H2L5abgLZwsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPs80czN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso3062085e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jan 2024 23:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706685021; x=1707289821; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vc7Ay37ay3645f2H/l3hoUbCFFGpLA9KuX/mQOmWXIA=;
        b=JPs80czNPh/LAg6Y6gi4RQkBT1BcxdCf5ZzhL92x/FA+1RjPC6qFmVrHLe3O9sK5wU
         oAlfIJHBMzHP5apviTANB2P3t/3ctHOlKernQZiZY45ItPHqLYXhPYgdzsXkYtQ+dSPO
         naU5rccvkGCjrXlWi52NrwlzrwjkrE+/CixDEpBC8II1l5NcjSBoYUw2P/0uXmaMDmsg
         D4rWoyoAFuhJmqytAgmYxTmLMN1KNER3pKjjhAqG/yciLSI24Fl8Br2ZFghcf0yHoVIM
         b5HzawekLeohOLaahuLy25SuJTqbtcpt/VUczpWBpmc0mqGyK/xpvmODRH2z90TE3S+4
         SCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685021; x=1707289821;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc7Ay37ay3645f2H/l3hoUbCFFGpLA9KuX/mQOmWXIA=;
        b=od7iJIJQ5EDThqOsYlmHPi+tkEC2SyLhb+zDuYfkLKe1Nxm9d4lBj41B6UgwSgGj34
         gazhTkeifk1DtK/nhWWisosDk2B1v91MDXcmdvmJiyC9I7HV2Q6qDpQuGVCx3sB8aNqS
         kTuT2S0JAOrJJ2rEf5QNs5vqy0BjhW/T2Q0rmQhgci1IomyjIhtqIX6HHYcHl+R0F175
         IcLg2iDAOTe+L0ms0YS+NWbgcnRn+DpIXvcjaUergS5+yJnuaiYrH+NtOy3xtBE/eUTx
         +/HUTR+kghqi5LmRpwrBMUmXw+FVd+4fJfPortO64Hci0lKf5aJad/yxsMgqjuKDcW3B
         R5PA==
X-Gm-Message-State: AOJu0YxIlIsWUwZxlIqngX+aENn8LVJV30TJA2CQ+kI2AmmjMwKpcFoJ
	w13DMu7zlZ9XClTYDQj4mNB70vv+64rvBYNfwCQzT6/HqSf10mVc7JO+WgCiaJc=
X-Google-Smtp-Source: AGHT+IFXo2HcWmvuyG4b6xsYseqZ6xdR/0xrJoLYo/RaHcbhl9ESjeisij6PH95V7cr1Hrpo3n4U7Q==
X-Received: by 2002:a05:600c:4749:b0:40e:545b:80bc with SMTP id w9-20020a05600c474900b0040e545b80bcmr619945wmo.29.1706685021366;
        Tue, 30 Jan 2024 23:10:21 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b0040fb30f17e8sm650884wmo.38.2024.01.30.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:10:21 -0800 (PST)
Date: Wed, 31 Jan 2024 10:10:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paulo Alcantara <pc@manguebit.com>
Cc: Steve French <sfrench@samba.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] smb: client: Fix a NULL vs IS_ERR() check in wsl_set_xattrs()
Message-ID: <571c33b3-8378-49fd-84e1-57f622ef6db5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was intended to be an IS_ERR() check.  The ea_create_context()
function doesn't return NULL.

Fixes: 1eab17fe485c ("smb: client: add support for WSL reparse points")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/reparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/reparse.c b/fs/smb/client/reparse.c
index ce69d67feefa..d4d2555ebd38 100644
--- a/fs/smb/client/reparse.c
+++ b/fs/smb/client/reparse.c
@@ -225,7 +225,7 @@ static int wsl_set_xattrs(struct inode *inode, umode_t mode,
 	}
 
 	cc = ea_create_context(dlen, &cc_len);
-	if (!cc)
+	if (IS_ERR(cc))
 		return PTR_ERR(cc);
 
 	ea = &cc->ea;
-- 
2.43.0


