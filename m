Return-Path: <kernel-janitors+bounces-10238-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCYtMxDWomkY6AQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10238-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 12:48:32 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C21C29C7
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 12:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32E09303C036
	for <lists+kernel-janitors@lfdr.de>; Sat, 28 Feb 2026 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8FF42EED9;
	Sat, 28 Feb 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lap50l+V"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE301DF980
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Feb 2026 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772279308; cv=none; b=p/RvqfpSe2ysbVol+FzAYDKdpVaIAQfm1dUDoYQ+rOBzyu94pLof8Wzbm6M4NAKQY9P3wSs2DiC52yQTlbntoc6qHiObjz3qex64isRSbnr40simJc6gsCnaix2jBUC87Gl/KsYwF33Y838Ryv8Mrmo0JTKypjXdncaUGTVnpxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772279308; c=relaxed/simple;
	bh=wxTihcnyyAsMHGR5lmRw9VbabDkYnXjRnrj5L4uFjkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pootJcnxvc++vKjIUpmJuoZh3OTX7GU1YKtdGpCnTq1788rbbi7ug95PzjMh3XlsENAG3wNkeZTz4G6wtWYmE6JM1FTBi7MVMHz7l7virL5swTI9ZxPaMQk6N1mjA2kZfddo+XsykpIyISWG7Qnv/N7Ntk21XGoZEL+mrsxuvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lap50l+V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483abed83b6so23670695e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Feb 2026 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772279305; x=1772884105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzMakfe/gCuMTNoRfsCupn/fCSXvgArEvTidpMiIPDc=;
        b=Lap50l+VEWYQIHXbmdWDWe7VAwEm8xOWzxraxHvj/UNHKvQZYk6nVJd/r4vRujQWDv
         vsDbiXYRS5uVXAbykuEJdTdlIgOf0iiWnmGwyOoqDWsG790D4OP4F5CKbgEX3JBaPSO5
         jxEAHNyCw2RVhZQ1uzMXmLx8UXKXOX0BhR3kUFq8o8IDXq5axK9RAZLiD2Dq278YK8AS
         ekNfBPqL4drnbT/bBzW+bj/pxfdcKOpPO43OeX7hqqJTuc0zIbJpV41UE/ZRdJR0Gpah
         Q7S3hzrV62us9rZxncpyx6RRMm0OVQ73+tpcednt91e6YKXFLkhm7kCDlGCqRpX2Ts33
         SBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772279305; x=1772884105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzMakfe/gCuMTNoRfsCupn/fCSXvgArEvTidpMiIPDc=;
        b=nxIZg9gObCUkpgk22pPlKo2I1PWoF/eGr/6vXO5zMt2icuMUa/QEh1yHy9oGefa2Jo
         5gRah7WbZsOjgWlmIY5Z58yVVuQLxNMNMPlkCpDde23ebfzvTq2BSxlKntYxMOZY1aE/
         Erf3T1QuNWSqo2lZcR8FBcmlm7LWMRG/M/UHezH51wgBRF1qHl1JzZleKJEH317Y91Px
         l7VuZydK2juQX22Sr2+MSk25RZGOALcFlvhjAyzf6mhnW3VH8FAHT7eZ43oxZgO1Syoc
         jkuHmuDOIEjJbcxSDGkJ4Ez5hQhdIPWqRGpi4zebWcVdIurKMyDyByYuXhif4Z4Nk1Tv
         4m6w==
X-Forwarded-Encrypted: i=1; AJvYcCUFFKU5THg7VCKV9Ly39jCZk4Q610kBqmJ7//K07a7y0g5dTYLZNvzAo5h6EYl6SYfZc3N6nkWTNLzgN2cOan0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++/vNabruBDxgRqZbah3samQGCyx55SU88O9lnilhrITUbS1+
	o5WRgjeYZt9m01Oc+FVAZulif5MQaNFBJd8RPYTRe5hMVH2SayaUI2DBRagxxpf+ENORfPDWK17
	Ga6+r
X-Gm-Gg: ATEYQzzMOrOMAgzwj1QBSb6FPqOjVuYY+UemTXh6VRIooZyT4YJracuYAZrMNdECfNC
	sKiiWdtRTCKBqMZLNaxITzaJrSnt3J8oFJFPVjd+2Osnli9S3DteRlIdR/E0xehnyduGv042Gd5
	3IxJUC6MtuyJlMsT+beLg08s/6ZqJGTpZpU4TWz5hbDyFy5yyInC6jqxE6uX8nuLWHQDJjVVvXO
	D3n0W2Gw/tPkZW8P5lIn74PYxWmpnWsN1JEG2R04dPvLjNTyNtWCVNba6sXvgOTrHm2xo/hpWoT
	V8aAaMib85RIKeOduqx/fphp5Dq+weNLLZLe6U4MXV6nIc6bZ6OLNJONdgB7m07mSUtk5oBNU3z
	sJitgYIwoj1YTwrBgF+K6i4fkUoUZpwmm6lwZT8st/ysKGurJSaEvmd3LcGGSYyvCIZhZE725dh
	3BaTZzVMpgcCeBRp1E1V2jhHANZJvO
X-Received: by 2002:a05:600c:c174:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-483c9c0bcdamr101457695e9.35.1772279305381;
        Sat, 28 Feb 2026 03:48:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm241547315e9.15.2026.02.28.03.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 03:48:24 -0800 (PST)
Date: Sat, 28 Feb 2026 14:48:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] tests/liveupdate: add in-kernel liveupdate test
Message-ID: <aaLWBYzuFg3ZuVmP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10238-lists,kernel-janitors=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,kernel-janitors@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: 273C21C29C7
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding. #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Pasha Tatashin,

Commit f653ff7af969 ("tests/liveupdate: add in-kernel liveupdate
test") from Dec 18, 2025 (linux-next), leads to the following Smatch
static checker warning:

	lib/tests/liveupdate.c:130 liveupdate_test_register()
	warn: passing zero to 'ERR_PTR'

lib/tests/liveupdate.c
    112 void liveupdate_test_register(struct liveupdate_file_handler *fh)
    113 {
    114         int err, i;
    115 
    116         liveupdate_test_init();
    117 
    118         for (i = 0; i < TEST_NFLBS; i++) {
    119                 struct liveupdate_flb *flb = &test_flbs[i];
    120 
    121                 err = liveupdate_register_flb(fh, flb);
    122                 if (err) {
    123                         pr_err("Failed to register %s %pe\n",
    124                                flb->compatible, ERR_PTR(err));
    125                 }
    126         }
    127 
    128         err = liveupdate_register_flb(fh, &test_flbs[0]);
    129         if (!err || err != -EEXIST) {
                         ^^
|| vs && bug.  This error messages will always be printed.

--> 130                 pr_err("Failed: %s should be already registered, but got err: %pe\n",
    131                        test_flbs[0].compatible, ERR_PTR(err));
    132         }
    133 
    134         pr_info("Registered %d FLBs with file handler: [%s]\n",
    135                 TEST_NFLBS, fh->compatible);
    136 }

regards,
dan carpenter

