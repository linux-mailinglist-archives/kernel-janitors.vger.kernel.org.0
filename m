Return-Path: <kernel-janitors+bounces-2769-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB58B201B
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Apr 2024 13:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8F23B24149
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Apr 2024 11:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16B985C46;
	Thu, 25 Apr 2024 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uK2Ud/uW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB322616
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Apr 2024 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044092; cv=none; b=RJ9ZPEmWndYCNB+PnPIVXklGU8EKEz+CFQiXt3Z4AwtjLPX6AyqPTxwkGzheVULx6mr7AQi59PzYEXNZJANT6Pk6/rNaYCNDFUkXvRNpuOQnGCc5ve98F4QE+O0+pvcsbbQsNKx8EY89a9NgmVA66MyQaoNxbGU39CVdeRyFxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044092; c=relaxed/simple;
	bh=4BR2yt7PuNf7nuqyNYPN52XbQh4Y95X32ylutoJfD80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tv6951kKMi+LWi1dNka/WhYOB+CF3wyLSmQWjxTsOALtRbbyQfswG9nqTiBPQv744X51CBEurBSN8cOo5Em2EKQCquFzkYhj8xmP0NyO0JqgUL9VP0SMPz6AVBjNChyPkC7dde0CRhmzV207PZTAHTkB3WxMq1Li41k63TpqWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uK2Ud/uW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41a77836f16so6673915e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Apr 2024 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714044088; x=1714648888; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXBdVhclN8iRuqar3CwvdUJWpfJdsgIEIzFUbTS5W/4=;
        b=uK2Ud/uWi8eyvOoN06ptc0FYctiY0yjQ8101hpCp4Oy3FJO5jPg12ehY5dKP74HG4D
         LoqyCVYoCLKomQpkVdICCbCYqtm79ib8d2kermN8RfNhi3gqZdnbVNnkU5BytJDg9bei
         tIyZaa6ZozT/GE+YUeEhhNFgyeyEIgBPC2NnJwxOWoXAfzV6F2xMUtZVML2WzjNP0rq1
         Y7oWW8OjKmFhElyH4Gn3vmjFYwvbi2jOSXSN6Ej0PtVLlqedpIjPKYOh2sVDqBAmJ22a
         8/hVF4bzHdb8GdjzZsQP2CfUUtq6PedPOVnC5dNZlWHZIhk+5W5/WeyZFdsJao5jx7nM
         bZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714044088; x=1714648888;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXBdVhclN8iRuqar3CwvdUJWpfJdsgIEIzFUbTS5W/4=;
        b=ebglA8bD7NqAzCFmmTK4iAjj1dqrMhEKkc18SeY0jUZQ2g9PZeTvJpjpxOChxHB8ZZ
         P+HlP+8ReNYN/4RBihFtdOuEkTrMgIlhAXiTueViOLcfJPft40BilZukTkMGr9Ng0tm9
         H4DZcGSyxmdJsAWR2WRB+rx1I7T7uwRfINlPt5nA8AMcmNh5qUKu045aknq3QZOwvgqy
         VVh8ehFuf5jR9yWxyiTs3vntZ6AeE+ExevMVaMSyaIIOuYgQpyPGS4zeIrBOLkoZpGQi
         bPNgDPXvG4mYAc/6y97u4XOBciKcx5Nu0V1deujKU5GDhud8AS7rcaHRnxCjdrq3er59
         JyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrfnvUPfSlsHua07Q/zsrrmsiwRu2kzWemaJpvwedKZQbQb6oQnNrw2Hz0wvwd6OInpI/N1uWTeIq8Hcz+c8forJcK5zWhdVS8QEB+8ega
X-Gm-Message-State: AOJu0YymsofRWSFRCqLz1L9ysH8SCGhH32PE3UJ9mArQAk9+ObK3zfir
	u244xw0CwD+drugpK2kxkuqK7urxEfeB2356t9gpwNZaHz7E1FJCbjykT528Mr4=
X-Google-Smtp-Source: AGHT+IEkRzF902REA9b5+gdCdVfVhX1mEE+4IWBK9dgathGvN8Vw5Fx6OzS2pvtmCTAMrqcKfcYtzA==
X-Received: by 2002:a05:600c:470d:b0:418:5e80:b7af with SMTP id v13-20020a05600c470d00b004185e80b7afmr5104977wmo.36.1714044087693;
        Thu, 25 Apr 2024 04:21:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d15-20020adffbcf000000b0034b1bd76d30sm9826105wrs.28.2024.04.25.04.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 04:21:27 -0700 (PDT)
Date: Thu, 25 Apr 2024 14:21:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Alvin Lee <alvin.lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
	Jun Lei <jun.lei@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: re-indent dc_power_down_on_boot()
Message-ID: <ad54bf29-cb70-49bd-a89f-c51ef7abb3ee@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented too far.  Clean the whitespace.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Delete another blank line (checkpatch.pl --strict).

 drivers/gpu/drm/amd/display/dc/core/dc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 3e16041bf4f9..5a0835f884a8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5192,11 +5192,9 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
 void dc_power_down_on_boot(struct dc *dc)
 {
 	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
-			dc->hwss.power_down_on_boot) {
-
-			if (dc->caps.ips_support)
-				dc_exit_ips_for_hw_access(dc);
-
+	    dc->hwss.power_down_on_boot) {
+		if (dc->caps.ips_support)
+			dc_exit_ips_for_hw_access(dc);
 		dc->hwss.power_down_on_boot(dc);
 	}
 }
-- 
2.43.0


