Return-Path: <kernel-janitors+bounces-2477-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 562358A0AB3
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 09:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1180C2860D9
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Apr 2024 07:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E9E13FD68;
	Thu, 11 Apr 2024 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLGvn8Ic"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6C524A
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822294; cv=none; b=GFaRNhuJGpuQLoYHzrj0QPgcz+C2WMwQanIl7tGASIxMJkMD47ZQHnLECIu5rGR7EKzjP1HBlQGP+NOdfoaLxDhdFmMyPB2fJCA8lXrFMAs3zksjhBdnLXbVCAG33ZXyMO3vMCunLKgrgP7aqUmR4lpthZGhKHlyRyi0pqosWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822294; c=relaxed/simple;
	bh=joMzTyz23qmG+b+PQc5HQqQmeMqXg/U9MthFl8kkmFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kilpPtidaXWnj40scNfNSlHpw6FHW3n74h6jIlxX+tnuHL2yotg8O6+st+7PbTdxY3ul7FdwLXxYimBSL5O/zRhpp/88yMHIGXPLEbcvHlbQt+bRws8SHpoCPAU87o6+cNTCisGbwZNQDMbeMaunElKBF8E3N1fTdw/92U1v4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLGvn8Ic; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712822292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
	b=fLGvn8IcGHnU6lcKrNb3iOO1UtO6C8mWUYV+ynx5Gph5yVft4A0y7PCKvlPIa5FXfh4bNB
	H3cF4cgZcE5qVAQZYtPe5h+IbE6HPdaLvdSGhfSKiM6Q7j32ctqvX5Xg4D00p1bre9ceyq
	dbsCeFI4GlG4ZmyPt/jcW/k3vJQi6AY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-m1VoAADaN4aoriTz1dv05Q-1; Thu, 11 Apr 2024 03:58:10 -0400
X-MC-Unique: m1VoAADaN4aoriTz1dv05Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78ec534f293so17323985a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 00:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712822289; x=1713427089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
        b=qHBRfXZD23mRwELdvP8+V0YV4sq0N0MUY40ob5vcon1tLj4WksIsXKuWDXleTVjxQP
         OgF4+QJkONJex1Yq0pSsLjsTvv71V0yOagq8ZLay2V85ViAFUcM/29pUI4kj+EV3HDK6
         P4fQsQFss2PUd6w3l0P/vF7W7W+4f0cNn4lb8oRXpiBJC5S3z19Q+aJ5LP4Sy0dg+ChL
         LTYouA0J7hZxPRGxRiTsCfB3JNR93AlclEutrJ05lcfkPbQIdA9rcjeAc+rQQysLejBL
         uet4MqzFOXhgycF32mWOAqZxJAZDIGzeXtiJX1N1h3iwBiv34WkJjAOBrCy/ma55bLS4
         2YOA==
X-Gm-Message-State: AOJu0Yz1/COuh0L0Y/ZValF1kU/svuwZR5TlhhiED8Ccpw86dFVebpyv
	D/4pJ83Cv/tRCeIl/0wIszD6YesphS5s6MT5jrH+UW0xYvS/ERf+GlDXDgU1EU6Z7YKJeNptn3b
	srDHc7FihUo42Hlh8AoNf8IJQCWhS9Y4UYu4DugiPzJPatUBZ/wy1I6Gy+oWlZKmBdg==
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id r16-20020a05620a03d000b0078eba91a4a9mr2901284qkm.33.1712822289626;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvSh9y4I/IGdCNvTciq7eFbqCOuLJohMuODkTcOR2jUHxmkOOxyBUfrylL1fqN6UUVEDDAUg==
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id r16-20020a05620a03d000b0078eba91a4a9mr2901266qkm.33.1712822289235;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id bj38-20020a05620a192600b0078d679f6efesm691961qkb.16.2024.04.11.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:58:08 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
Date: Thu, 11 Apr 2024 09:58:03 +0200
Message-ID: <20240411075803.53657-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8167bd1c8a45 ("ASoC: dt-bindings: ti,pcm1681: Convert to dtschema")
converts ti,pcm1681.txt to ti,pcm1681.yaml, but misses to adjust the file
entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS after
this conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5431f06ab55..d39e0f2556f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21976,7 +21976,7 @@ F:	Documentation/devicetree/bindings/sound/tas2552.txt
 F:	Documentation/devicetree/bindings/sound/tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/tas27xx.yaml
-F:	Documentation/devicetree/bindings/sound/ti,pcm1681.txt
+F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
-- 
2.44.0


