Return-Path: <kernel-janitors+bounces-6898-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E9A16006
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Jan 2025 03:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050D01885482
	for <lists+kernel-janitors@lfdr.de>; Sun, 19 Jan 2025 02:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8708F2BB13;
	Sun, 19 Jan 2025 02:59:04 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E81AD125DF;
	Sun, 19 Jan 2025 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737255544; cv=none; b=qrHNGRd3xYZRbMkWX5OL7ANPQGf7lMaEpELZKzDfQwuMXNz1kR+f1exkp/qtiNimx82QFCks23KQdKk7rMJmLMU+whcYHryD4myxQxQvdBPCeb816WmiR4l8kJs0RGiHs89yH8GD2/6kLqYNtzn82Avu+c1JRTSaIwtIJYEUXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737255544; c=relaxed/simple;
	bh=a//tfOZGtkWW4afSv1n2BQFeSUkUXBUqmvqoyUU9zyE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uup70mTfpLA6NDfuhc+l90CVLLvEWkMfZfZEmGYaSbksMMqCaC9CnciP+VMXc0JEbKWVstfO4h2pZHnG7l4uz09+OyMLtUGK3W9xgCOg6KwL3UriK/FosVTgsrzRwoSGauCzJcGEcVtvzs8nbafgVcYUI/vy2xvXm6Q+XImquXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 8B88A60106CF9;
	Sun, 19 Jan 2025 10:58:44 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: Su Hui <suhui@nfschina.com>,
	mary.guillemard@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: avoid garbage value in panthor_ioctl_dev_query()
Date: Sun, 19 Jan 2025 10:58:29 +0800
Message-Id: <20250119025828.1168419-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'priorities_info' is uninitialized, and the uninitialized value is copied
to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
'priorities_info' to avoid this garbage value problem.

Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0b3fbee3d37a..44f5c72d46c3 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -802,6 +802,7 @@ static void panthor_query_group_priorities_info(struct drm_file *file,
 {
 	int prio;
 
+	memset(arg, 0, sizeof(*arg));
 	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
 		if (!group_priority_permit(file, prio))
 			arg->allowed_mask |= BIT(prio);
-- 
2.30.2


