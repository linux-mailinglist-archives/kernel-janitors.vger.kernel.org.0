Return-Path: <kernel-janitors+bounces-9214-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F72B9969E
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Sep 2025 12:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E914A2502
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Sep 2025 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7462DE6FC;
	Wed, 24 Sep 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvdHD7ii"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A42DE6E6
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709385; cv=none; b=tHVaXTWLyMtjhQivFDmZrcnH6KHdf/9wtPPfXY8yLSAnvhoG5dEQXK0rtAlC6IqcgvSmeqk8nWaKC5CKTKGEjaPwJIW0CICDnygrFn1bDEG4OU8wChr+JVlgKa3JCx/9nMEfaUBCTBXoO7uKsN5V4icdiG1niAA4NZfNrzt3zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709385; c=relaxed/simple;
	bh=70m8hIHxbgOeHMiX7Op2kXSoJJya+09jCQ+CrFquVZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uqCT8ji3eqO3jCzetp4bYmeQ7itTzz1f+VhJNKJwZxajobRzXcszr7C1CNF6o4MJPgZofB8mj5iP2QchFMNcw29rBkXJcydjhLQkqlZ/sp3Ii2tLc93uRxvwGdPCJgbktEqpDV/8fUAuC1oe+tnH/NofPmOKWo6mfibyx+PWI5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvdHD7ii; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso10198075e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758709379; x=1759314179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
        b=PvdHD7iiom+tbN5R71tFRPm6867+xfycSFIQvMU+rQJDnpGwKk/qIaGTEEBTFmDrnP
         NRz0t1IGZRMcVkteykENOWj3u2GCNFnzscORO8lCbJYn0MvdGR23OhmddtyJ/yAqqerX
         D8K0GAowA9q3MfwiZX4BzhHT6qFJM/weg9jpAKXzd2cDEaChyutJ6VlJo+uzEHXnT792
         7UtWLXk+FbmGdFpATlAQyI53a3GGxPyFQ+Rz13ZvGYxjbxlK41ScNadHxabKB5jigzPA
         Zy5slThkOoFxaeo2UXVut+I/hUiE47XiAkHuc7eBTbJzuwioVvQIlRIJA5lyrsv1bHFT
         1QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709379; x=1759314179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
        b=NdsE67JvNfRFqlNgdHX879yZ+kSX0K88X/v8TGDqmJWbeSUe5HToT0hnlhXBlknmer
         KQ+2KiaHKaQBn3Y8LFZek/aNVnKbFey/NNZPkmpBcI9Dgl/gT10p+fncw8iHC1hU0qA/
         i+IwWBSDPtPQPamnFqKVzRA5A2fJ1Rw5F0xqNJDvizjU3+L2m0L8296LOOldWdFJPjz9
         0rcDnN4vVN9G9FA5b3BZqus9bK18TFcLKjX3uJ4aV+NvnFO8pubmwjdiec9lEo67T0xo
         OEb5I+Lgklo0aHpfIQr1NgEEc9IpkMEumJFkPls773rEswvEAK7zIdju/EHwktdE3dzF
         jtAA==
X-Gm-Message-State: AOJu0Yzg9/pWkxiA+E7rmWwHtpJH7d6nBQvDSR0cIM0RWYH0jPagH7x8
	vs5kZZGl19esxQrsTKnEfqepvDyiT+a98e1tp2y2WHs0lTKZLAhPpXhU
X-Gm-Gg: ASbGncsEKNR9zYKVsrgPjbH33/BFElZw06CF7/2bL/TbaDzDfj6pmEpt57M80DmEY/8
	vI1eLgQDupiMs4/Yr4784HLX6gZPulQSFWAT0C44b2iUMalMeXZpUVzJYlbmatQ+R1QFQioPDAQ
	kjB0DC+7dXPVwPhXtwOvwiGmKuFCLNE2R7esB+AXjSZY9A2ePjXw7oKA65CmiucYJJQQfDQNRZz
	4Okw6iNCqG5MSxpSF4o9iVWVAYzswI83WCp7WfN7IgBU9fKjlzxVWKqFgJ+wjLAryGaxBq9FPmU
	jPifHw2brJkU/pmLkKe1l8NwViSOvd/i0HzwiZgCDZjiYXSfrqYxwsVAiv6WLnMAd+eSYYDsSxG
	olorJ7/OZ4r5kJkdixaTJ43ffoqgma3/Y
X-Google-Smtp-Source: AGHT+IEaxHf/2iRwwqfoIfQ+Znhm/drcILF6bGn2vT3pOma/+G7W3dJJfRF76aIPViePMXlaIdlZhw==
X-Received: by 2002:a05:600c:1d0d:b0:46d:fd71:f69 with SMTP id 5b1f17b1804b1-46e1d988de8mr46724395e9.14.1758709378513;
        Wed, 24 Sep 2025 03:22:58 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a9b6e1bsm29341975e9.10.2025.09.24.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:22:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Badal Nilawar <badal.nilawar@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset
Date: Wed, 24 Sep 2025 11:22:08 +0100
Message-ID: <20250924102208.9216-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy checking
a bogus uninitalized value. Fix this by initializing offset to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Fix identical issue in parse_lb_layout that I ommitted in the first
patch

---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..8f5082e689dc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
@@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
 	const struct csc_fpt_header *header = data;
 	const struct csc_fpt_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* fpt_entry is mandatory */
-- 
2.51.0


