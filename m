Return-Path: <kernel-janitors+bounces-1471-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5F483D608
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jan 2024 10:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5E71C2675B
	for <lists+kernel-janitors@lfdr.de>; Fri, 26 Jan 2024 09:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB7B12BF24;
	Fri, 26 Jan 2024 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wg3/9hFa"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507D1C6BE
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706258514; cv=none; b=t6dYQWEtWrJe1zcrQpbJgCYu2NnNCRJrj+PuJjZEdKh0XKhISxPGUbMeAVUnfR10MvR22dRkoWdTyeqGmVssK4AsDP5EsTrOb29g13XLcSHyOhtJvPetUOU6ljRlrBj2uuyTGVh1GOFzCA3qVKnTQpVJKT0fSaVk41wz3lkHomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706258514; c=relaxed/simple;
	bh=JnrnAWx1YmbnGWJzTzQmFlWxZHRMFnM3TZP+A72q7YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOApbdvKe0OwLw6wOJdDf6C2yqw1hansSzfSmk1WGGT1xZX0EELDDQ+HZGHAIOrmsjZjz+Wr3xD4++FM7f5YTVZOMx4PYMpe32Nhdjdc1jgcMCbZiglJq7Emz9Ur+oVZa8JF603l4oNaHzz2PLuvgGM2OSgJQnA9sqN9drsVdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wg3/9hFa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3392b045e0aso139526f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706258510; x=1706863310; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
        b=Wg3/9hFaDCkdLyUec5JYl42eDyJad/ZiNHFB+I7Y33tpOvgYOyHN9JxjmzhTFYPX8z
         buimo5055u2Jkv+7S/U1IGgUg69HI3TJhwQYoy/2QVqdLEblr1ptLZKQeOGexnvm815J
         ddzgveqQDdp6TLre3Ffg27G16/aNGOgNtNu+azXpqhonhvJO3eFhM5IUR/JD7a/6lXpA
         ReuOlTqY+N5zc2rHe8rzaCHQTRRMHOH4lvECbY/MGQ6CA1B7uL6epECEbUAXwRsNY50c
         xcHz7/DfuBgJU0CWkzgXqhhhzHE4Y5osT530ZVylf1QTdAowQLyly3679d+EvBhZ+AZz
         Sc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258510; x=1706863310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
        b=KhelKMKtYxB6PxQdYKTvuZ697XRld7eYGOU41A7pXvgoaEg2U7c9Ohk5b93TxYtvRN
         NydNSkpm4OVHo6hpWCFPTaNhx8DLhd4A1Etc93sO5oEiz1RS/Hg6oVTw83JDTMznchNt
         YvyybdyZSoBe14i9F+xrEcas2XnYNTEzlN6Y+HbKkK1xJreXxQgug9GoMBfxBsYroTZT
         nEz34JjSj4ay+BwSSvv/YroEsG7sx2cGkbGJHz32aWxX5GieURgtH+536bUbJf/tUJRE
         4W77P3HibBZT1HaolWmvbRDwHZr7DqR/AC2CJmaU3MSas2O8baRwFsq/sIWWizBycY5Q
         2Tng==
X-Gm-Message-State: AOJu0Yx8AaW1eXihGvYKoTgChaKkQDzVtecqBOXM9jFNHO4ZmnsOCq6t
	C3zFgN+0Tz8KehjKKilZnM2mnSrMHX74l0CurBVmS5HxweouXfRL4B9OgxGgMh4=
X-Google-Smtp-Source: AGHT+IGODQTp1WGBJOYeb5QpU8MHe6FvpWAhmxNfECU8K2SX9RjwK0yxx8LAKL3RZy4pjkFNfgFKVQ==
X-Received: by 2002:adf:e852:0:b0:33a:ddff:7774 with SMTP id d18-20020adfe852000000b0033addff7774mr24330wrn.36.1706258510562;
        Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id bt7-20020a056000080700b00337d4ce6ab4sm766097wrb.20.2024.01.26.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Date: Fri, 26 Jan 2024 11:41:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhi.a.wang@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Fix uninitialized variable in handle_mmio()
Message-ID: <11957c20-b178-4027-9b0a-e32e9591dd7c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code prints the wrong variable in the warning message.  It should
print "i" instead of "info->offset".  On the first iteration "info" is
uninitialized leading to a crash and on subsequent iterations it prints
the previous offset instead of the current one.

Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 90f6c1ece57d..efcb00472be2 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2849,8 +2849,7 @@ static int handle_mmio(struct intel_gvt_mmio_table_iter *iter, u32 offset,
 	for (i = start; i < end; i += 4) {
 		p = intel_gvt_find_mmio_info(gvt, i);
 		if (p) {
-			WARN(1, "dup mmio definition offset %x\n",
-				info->offset);
+			WARN(1, "dup mmio definition offset %x\n", i);
 
 			/* We return -EEXIST here to make GVT-g load fail.
 			 * So duplicated MMIO can be found as soon as
-- 
2.43.0


