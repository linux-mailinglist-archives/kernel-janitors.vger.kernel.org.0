Return-Path: <kernel-janitors+bounces-485-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4B7FBCE5
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 15:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E991B1C20CBA
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE965AB98;
	Tue, 28 Nov 2023 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3gg9VO5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607F7D60
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:19 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b40423df8so21987835e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701182418; x=1701787218; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaKrElE1AMJOvXqLWag42ZjIrLYDCFvrlaWvSZAKArw=;
        b=r3gg9VO5gCcnwDOz0pufW2ZafaiK/KADozXnqcNaxv+Agpv96S42mZj66g9d0umPKr
         lz5sG4rJEKW7g+9znCdibcl1tNEbBsNY/z8oaUONLWxar3OUa6OALrZL373AZXtuAH6I
         z6gRYIte5SJikACtGjR4dsNpRkwo7DvEY9jvxMYjN+VKRg6I8lrdujCXlArsX/OyykxZ
         fkRhz2338ofvFMnaLqiQLmx9EXgioLA3R3FrDBiMnvoIGYeUPIRYzJQCmUh64bqhwOYk
         lBt/3l31k9jlDmI7njU9gtLDaDx3VurxDLFlpy0IFakFZA9UVmmCANEfS7NsBaJp+X8A
         50Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182418; x=1701787218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaKrElE1AMJOvXqLWag42ZjIrLYDCFvrlaWvSZAKArw=;
        b=QSVQzOUfrBba2/2bxGPtc4YMKsl2W4psq/VYO+JKuq8SlYAn7FV2pBPKd48cU5WdH3
         bWqwlORQ2La5wLhz+fU367CraJa0NwNqJwLX46jSyX4ziYkW34b+ArBDYEmQXMTTOkR3
         d85fIJWONMcTz1RwdpSy3wRogS8lSDU1SFXWzubN0Ei6DnoWneOoDi6xP+n2Pgarud4t
         qgdu4Upg3Kpm0O559uEzooUE+DHRfabllZeDdw78OyBnY0MSQF7UAQED2inMe53raEfK
         R68/6cEbB03qofvRO60AstFxbfIZc82KpqTSWd+woc5+3vLXpSBlIHew9uihIdKEbD4B
         MqFg==
X-Gm-Message-State: AOJu0YyBfHXprWpGJvgqszXNv2tZnwJcT+LIi+txr7XnDH63tFrCbSn7
	NKBcOq1kODN6D7fsg9l/C1X6OA==
X-Google-Smtp-Source: AGHT+IEUXsu35JfaoTse6WpNi0aat3trZZEVzz9HHjmeo+pJm7QYeZQ28Vz4IccP7yCA63IgMU75YA==
X-Received: by 2002:a05:600c:4f82:b0:40b:2b42:a1c9 with SMTP id n2-20020a05600c4f8200b0040b2b42a1c9mr10704074wmq.23.1701182417945;
        Tue, 28 Nov 2023 06:40:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b0040b37f107c4sm16321352wmo.16.2023.11.28.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:40:17 -0800 (PST)
Date: Tue, 28 Nov 2023 17:40:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jack Zhu <jack.zhu@starfivetech.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: staging: starfive: camss: fix off by one in
 isp_enum_mbus_code()
Message-ID: <7d222638-2d19-466d-8dd4-9e1ceb1d46f3@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These > comparisons should be >=.  The formats->fmts[] array is either
a pointer to isp_formats_sink[] or isp_formats_source[] respectively.

Fixes: e57854628f58 ("media: staging: media: starfive: camss: Add ISP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/starfive/camss/stf-isp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 893dbd8cddc8..98d61d71c31b 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -120,7 +120,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 	const struct stf_isp_format_table *formats;
 
 	if (code->pad == STF_ISP_PAD_SINK) {
-		if (code->index > ARRAY_SIZE(isp_formats_sink))
+		if (code->index >= ARRAY_SIZE(isp_formats_sink))
 			return -EINVAL;
 
 		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
@@ -128,7 +128,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 	} else {
 		struct v4l2_mbus_framefmt *sink_fmt;
 
-		if (code->index > ARRAY_SIZE(isp_formats_source))
+		if (code->index >= ARRAY_SIZE(isp_formats_source))
 			return -EINVAL;
 
 		sink_fmt = v4l2_subdev_state_get_format(state,
-- 
2.42.0


