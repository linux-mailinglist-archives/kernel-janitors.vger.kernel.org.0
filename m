Return-Path: <kernel-janitors+bounces-558-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D168032AB
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 13:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBC7AB20AE8
	for <lists+kernel-janitors@lfdr.de>; Mon,  4 Dec 2023 12:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF121EB42;
	Mon,  4 Dec 2023 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iidQi2oE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CE5FE
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 04:30:11 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40838915cecso44692595e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701693010; x=1702297810; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKvSKITUcl+fN4QbSnsBMTLDMl3HA5xQPt9QvlGXEbI=;
        b=iidQi2oEZuoBshT399Uzx8Izs0wKDb026uVoEHZDKjFt7urmkr/zbOR0NCH5+jQQVI
         HznfLEFwTl+OpY6J3gHQkQBwaSrNYChAC1mJPq59pU76aOZnnf+9XQ4jmBaBgNRuneFG
         4EFLAEbk9qZfACPXqi/XTzLa7GmSuV5+ERaT/MDTCNOKZfvgrFO69VMLmLtqt8UXPz/7
         wmP3e0zLK0bkG9KDDQM0Xb6A6XXXaOQkTP0VnTIOStAsV+QX8xNIOOLY5em/mssQYVBk
         xht8L2ZfQ/2gPCCwTtG0RuokVmeVAVH0nEbB33yAPNa3BhP1kcN6Gc6JJ+tQMf0J+KSP
         N/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693010; x=1702297810;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKvSKITUcl+fN4QbSnsBMTLDMl3HA5xQPt9QvlGXEbI=;
        b=IsdR4uGkPCE5k3/6UewwJkdaHhybuOymTI9jbstrqCR4VicLi3LSnSXqxdXTOG9lLf
         PMB38o17eitKgwjIpRQ3GDDMzPkNHfKHdmkmvwi3+dbfYyH/LKYr0ZqWGQoDVZchubTa
         cBUUg6fbSQ8TN80dgVTh1L4YSV25zjlsIpbOCVDtnBP7PQy2cRLgz8U4eK7lHQFlI2+V
         hai5qp5CobeqgQKuvQotnN+pYor+rC40piaT2/R5NL7xn4CwHuroSD+H+57pmLqOGx8e
         OmbMb9KR8Z4MDmdfwoy7q6BLLAA5hgMtwxOdv3gEnt/xq5lT8q2Y9dwYzAe1tiPubpd2
         wVUg==
X-Gm-Message-State: AOJu0YwWOI4SC2JzuekWgcjYOK0R7264LThMsqXE+rxsGAGKiaKXTZST
	ukXITCOODrXugEUwNsyF23IXGw==
X-Google-Smtp-Source: AGHT+IEnpV3/O9/8ri5kU9IVDoewSq6OVRcJS3PmnCJaHELXOk53y0yosvmsMWPxzvXqFzDfVsT3QA==
X-Received: by 2002:a05:600c:3417:b0:40b:5e59:da7a with SMTP id y23-20020a05600c341700b0040b5e59da7amr2376583wmp.141.1701693009855;
        Mon, 04 Dec 2023 04:30:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c511200b004064e3b94afsm18454841wms.4.2023.12.04.04.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:30:09 -0800 (PST)
Date: Mon, 4 Dec 2023 15:30:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nfsd: remove unnecessary NULL check
Message-ID: <0cce4257-6c22-4c0a-b769-b946990413fe@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We check "state" for NULL on the previous line so it can't be NULL here.
No need to check again.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202312031425.LffZTarR-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/nfsd/nfs4state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 40415929e2ae..fb551a3db1dc 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -6639,7 +6639,7 @@ __be32 manage_cpntf_state(struct nfsd_net *nn, stateid_t *st,
 	spin_unlock(&nn->s2s_cp_lock);
 	if (!state)
 		return nfserr_bad_stateid;
-	if (!clp && state)
+	if (!clp)
 		*cps = state;
 	return 0;
 }
-- 
2.42.0


