Return-Path: <kernel-janitors+bounces-2473-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBA8A0877
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 08:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C08AE28759E
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 06:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BB813CFBA;
	Thu, 11 Apr 2024 06:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="czIca6VD"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD113CF94
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817009; cv=none; b=VVvaNuJSkAK5MSV2Uw/G/0QfJzwjSys4GddEIyZwKjxgG8cMakphpeRCfF0IAPrn8I89hdPR4QILJRTdT/ifzJVJ2BAd2xKmteUEuactRmkWd86GcOfeIGGE8B1OG2v6OQDeaSZllUuR162H7iUS1qpE3JpAU2+GK+5LrPOnvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817009; c=relaxed/simple;
	bh=GjQLh2SS+UPCwTeY5t5wo2LRXFOxwUNhEd58olpc3fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxVOdcT6u23ECLl/2039zh4hTTeQK6AvWXNVlGzPm/UmDJpAEhnxtfeTuzNiAmIS4NUD54ASBzLp3JrdzbevIsJvvjgcKk+5O0PSw/PHKLrmXI/fRRy5E+Zou9CXd0KjGaRF1o+Gm3n4RamshCwX/HHmHbVaEMiVfwAZCXTH2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=czIca6VD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712817006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QjytyvFJKqQcE9RcFAinE6xUHtFSAIxr5mwB8QS48zU=;
	b=czIca6VDyLkQe/8lnOF+9J+m4oBHVCPearTA+Ce9vUOKnjbkDmDoDCvyGMkYHygLPKneu/
	YDrQObIqRNSICGvpqvuYDV/5cBSFAA2m/fGMW+vOAPyUcdm2ZJjuWKGOhNczeNGwu7HOL9
	Ubh1ShVqhLV0omUv8wf0p0DHk0Ds4k8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-tt1D2e4rPbStU6fe80Fylg-1; Thu, 11 Apr 2024 02:30:04 -0400
X-MC-Unique: tt1D2e4rPbStU6fe80Fylg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51a2113040so331722566b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 23:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712817004; x=1713421804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjytyvFJKqQcE9RcFAinE6xUHtFSAIxr5mwB8QS48zU=;
        b=tSl18hlnPPjFUyYaVBtTiLOs83JAV/FegW73t8rEj3h3CnIJObdTbZ+xpuuqAB0463
         PzzyuAKxt1uhaTwybLyGLXMKnuhJ8uclJCtUWNIA2v7dTQnwdGnE+a71i/ggblBPobe4
         U07FrvF3Ure5utuix2PVgWBypAp8Ne26BrignNxxWWIafq9BZuiHVSBg7i0M4dV8zdMb
         wWYa5iC2+71jSNzELbQPAalu0iieNsVaz5KSTcvuG/LIv1aLugLL10ZAf4tjpQrShX3e
         4X4h6bSMk7zJMwV+VobHYr2osn6jUX75MpHLUCgCB2AZ041roCchNYlsZx3pwMmysPdi
         Drgg==
X-Gm-Message-State: AOJu0YyCpEkWVXuFhRTMzpviUt1X4vaPdCaZttm+LgeTh1xv2v6+CEKt
	1G9/7ZfQBwNPWW6OY5PgCpcAYVfDalajNOLnJYzqR/mlBtncvfVdz8a0MqXYeRptqx2Hc1nHulJ
	gLSGpiYJ+73bD6HgAoR0RlVe+jpgtvKsSJQ+Mt9cacHKaTz1fJgG2jEeIUMIjmQLjLQ==
X-Received: by 2002:a17:906:52ce:b0:a46:d041:28e0 with SMTP id w14-20020a17090652ce00b00a46d04128e0mr2888128ejn.59.1712817003804;
        Wed, 10 Apr 2024 23:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuaTV6OOaUHrKVqTyvBXdctBjECsiWe/03rza41UgNLqH9ZqvOo15Y132Jc6oe7ETPBxBFzA==
X-Received: by 2002:a17:906:52ce:b0:a46:d041:28e0 with SMTP id w14-20020a17090652ce00b00a46d04128e0mr2888118ejn.59.1712817003426;
        Wed, 10 Apr 2024 23:30:03 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id kf20-20020a17090776d400b00a51e9b299b9sm433138ejc.55.2024.04.10.23.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 23:30:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust DRM DRIVERS FOR EXYNOS after dt-binding conversion
Date: Thu, 11 Apr 2024 08:30:00 +0200
Message-ID: <20240411063000.48794-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ad6d17e10306 ("dt-bindings: display: samsung,exynos5-dp: convert to
DT Schema") converts the last exynos display devicetree binding to json.
With that, all exynos display devicetree bindings are now located in
Documentation/devicetree/bindings/display/samsung/ and the directory with
the previous txt devicetree bindings, i.e.,
Documentation/devicetree/bindings/display/exynos/, has disappeared.

Adjust the DRM DRIVERS FOR EXYNOS section to this change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03204db05027..c2d913c64704 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7221,7 +7221,6 @@ M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
-F:	Documentation/devicetree/bindings/display/exynos/
 F:	Documentation/devicetree/bindings/display/samsung/
 F:	drivers/gpu/drm/exynos/
 F:	include/uapi/drm/exynos_drm.h
-- 
2.44.0


