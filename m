Return-Path: <kernel-janitors+bounces-7002-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E55BA2A307
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Feb 2025 09:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2203A294D
	for <lists+kernel-janitors@lfdr.de>; Thu,  6 Feb 2025 08:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81039225413;
	Thu,  6 Feb 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EvfjblR5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237971514EE
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Feb 2025 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829829; cv=none; b=kheYu6MUzV0Gjr9fx/R1rpzGpB1wGYWcXSOBrtrlvPaSVKd8ZMcH5jLLL3ppNHATevKMdU7PckdHDKNTG94EHSrJdp5mPW44xYrWP0bIXJrng3vHRdhgXbUMVDQq0KUozZW4AgJHI6LuJcvun/31zmt76KHxwLqYX7Y8Ttxwc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829829; c=relaxed/simple;
	bh=jEJ+dzjS9jkqBg5sz39XNcksg28cvuzTKz0gQ8s/HRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIbas137UqPs3PAeLi8umpC/dxR5UtVb8EzyTStiDcwXeVmzGT4K9aMdAr1FyhnSSK6YnRXJ3VPatpCbYPnevJ5jPNQ7Jqgga9brOvfEFb/FKFUh07v6g7kUoX1Yobgh5Zt8Tg1cV10KdZQw5gQ4pKze7w9QXra+RlXkxQtRGD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EvfjblR5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43621d27adeso3474795e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Feb 2025 00:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738829826; x=1739434626; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubql9r1omCt43g1m4gjLWGeKKiFiLncoJpuHUqF935k=;
        b=EvfjblR5bg4TmIZW61dM0iXo3gfCZ8kQC3nV/am8kYd1I59JxHDrihw6kLGFERjhMn
         btTW4SnHNdLthJ9y+iuo24NeT4JPjyww5BF4ViLyna5WXxoj/8U421BcfkYH9lW8Vt+R
         iBNFDold/gBRSu80VHbjR/+uTVqF9Y37P7Gq1wX2xZ7b/Lv5X+xBZPEvOD5EQySRB/j1
         UcOK+yoe35VVXiVqOTKakTOHr8/YfrHgkxbGjDlHgz1VisqO5F2A6Dbf9onMW2lID4Gt
         yZdjt7wykIMqE++TrdxdB/W1Q2T12ST1ZsoiAzIsS2/40VQ+xAJqUX7VSBrfJDc2n5RY
         gVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738829826; x=1739434626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubql9r1omCt43g1m4gjLWGeKKiFiLncoJpuHUqF935k=;
        b=mgWTKoiGhl4AP3hcpx75aripAVtQSmfl6vbJhBNr6FiKedx1EIkPhC52T1yO9xQTTg
         CJWQjCX6uO96m20gCq4M55O3cQqvMfAFHpYZCCIxmmF1ELOmyBy6OzI8wOWTikbOr+F6
         pFT4jZ27fh7wMyV/9/5OwkyR5e6qZiJa5RoDolBp2tb7J5mKVhc2B0Kg9QtpFrjIf+Mv
         zU/PJK2dn5qwhpU5/OzLTL63onWKXVoxPoeMYXzGTIrlBa+2Au9RdlGKo0tynU24GDC5
         4Bs25vN9OE0GPlT5YJHZYTeRnG7JHf+mulnIbDZnlwhiAfS6sdD4ji/Nhu7KEjJGEb/t
         eSrg==
X-Forwarded-Encrypted: i=1; AJvYcCVUkAjR1TzWt89zoOWZ/F9olmUwJnRnYoKCaUfnn1a/K8PCCTN9fXt4f15X8Z/h0r+uQYJF1M7i3fEpSnKislU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2KpYsHF1cGtHMB14J4av6dj1PMmO+9XHaeGvyS2Ug5nsWzp0
	g4MwV4agMx6GmdiGRhvacCKDrhUi6hsiVF3AqYmBpIA4h88xG/rrujbUdeoTvEs=
X-Gm-Gg: ASbGncuWfmlyDWyZyL+JCrNSYtYK7CKTrl6UTutYaio/f9FWczl/yjoZJAArFk87lLL
	dYAh3Gy+f7L3jFzBurNoU4dYLiCLhaVD/Xa81GXf5EC3txXD4DkMtb8huOY8omafnhdu1mqRI6z
	V5CM8A8wtCVQ7JXy6zfhihROv9D6qf+WjvLOlQ/UXBL2IRmb+fbcZRr7cbMrR3+eZhOelKyQjXZ
	7dAS6IaPQARQXzN6d4h1T+xX9TyCcTH2X5/ETcawvfyxnHekSywKIetbZm94sVsN7swffyVOgln
	nlEdO5hPa6iC7oo08eDO
X-Google-Smtp-Source: AGHT+IF7c/c3cT8gIKlZmV09tdvJuSUhNmFcmUl5w0RwgKRFabBb32VFjSdJlhbFnDoNrb4CYnO3Bw==
X-Received: by 2002:a5d:64ec:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38db48ba435mr3619651f8f.13.1738829826339;
        Thu, 06 Feb 2025 00:17:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbde1de32sm1040103f8f.83.2025.02.06.00.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:17:05 -0800 (PST)
Date: Thu, 6 Feb 2025 11:17:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filemap_lock_folio() function doesn't return NULL, it returns error
pointers.

Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index a784fb44e59c..fb263b421958 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 		struct folio *folio;
 
 		folio = filemap_lock_folio(mapping, i);
-		if (!folio)
+		if (IS_ERR(folio))
 			continue;
 
 		if (!folio_mapped(folio) && folio_clear_dirty_for_io(folio)) {
-- 
2.47.2


