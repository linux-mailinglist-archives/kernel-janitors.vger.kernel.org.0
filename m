Return-Path: <kernel-janitors+bounces-4290-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 280AB914319
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 09:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A5C1F23E0C
	for <lists+kernel-janitors@lfdr.de>; Mon, 24 Jun 2024 07:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A363D551;
	Mon, 24 Jun 2024 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cfmm5rlX"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740FB44C68
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 07:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719212621; cv=none; b=TmjOFY3VfXe5CrR9tKG1LHUvdwe7IAW6UZMy6AJTfBjSIvRFZpFnQN/1E2q8JACY77uKtbscIyDRivxSzkRV4WQqESgl9OOuLroN8WTif79kd2CgSQ3nNj/gAtqcfON/w7dOf9dtQoQjeQQX1VxuB5vEzZBdPrdowaKDcJd6/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719212621; c=relaxed/simple;
	bh=xVuaAIGZNdS34n4S1r0wBBnctxLpzF2ka7fvSrTsfE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ux+qSlzIdRvinDxrgOHg6KLoaCmKNjwzQdzDEIQMOBud8+7NI5igud+7VsHbC5gXPfQmUtcqOgQGDXQPPR1WXgAHcr36VYXVIAxDR7ySlabQswdjDxeCt9ZdbJNhztCwwCRYKp27+IGDKJASn8kkCsdG4SQJ7YfcW3T6dlbAj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cfmm5rlX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719212618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2sqF8kaCPYuDxl9QKAydlnLMKrQEyE2S3UviwAcAdw=;
	b=Cfmm5rlXClNapgoTcAwDZm1nK+dBZCBr8NEBFfu7j84AdS74Q1kVfUauldfkrVoSDEtZa0
	BXaCo8IZdmyTtMepdRa+jfsqLX/MytlWDQ192b5jHq3E7/tBKjnOl4KrcsCcAoYpZ2zWUP
	phabi2zaelASsFMJnyV4PkKvxdxCxEg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-j6t7L4YuMfedOjWJ-eb_Uw-1; Mon, 24 Jun 2024 03:03:36 -0400
X-MC-Unique: j6t7L4YuMfedOjWJ-eb_Uw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6def6e9ef2so400625766b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 00:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719212615; x=1719817415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2sqF8kaCPYuDxl9QKAydlnLMKrQEyE2S3UviwAcAdw=;
        b=CGt++Uuyf/XZsGxbWQ0H0a6yF4srU8tfsmUGt+qcr5CMIvt+dqd3p9RAuviytPhYq5
         JwzsWHxeBVaKdTMWHi/VFCqNgj6qlNf6cm44j0R9K2wWAz8O3VF4/d4+bxUdL9FB7go6
         zh3iIfEgCdrqqbmkXnAUPMXHnkf01pi2s0g+HTpT2YV6bCT/SMMuPnVANCREPXl03aWd
         icbvjNObcIzXO6b/mVFv9Nly47SP31fS/Y7wIUDW7HYH0mVyb6a+Bdc4CWXjg5MxH2B9
         /rurdXCa8ovuiOLdKsNGQl3cAhEM8C6+M/H7lAbX9d4m276Y/+9kdS/p6iVdePH2Po1x
         YbtQ==
X-Gm-Message-State: AOJu0YyBF1mu3jABKwk77z8KVP/6z0pXlkq5luV3SVRLrml9TSXEyCz+
	lw9jSBzs6RI+MDbItfMPjBcHc1BIUr3gzcc5bVRg/iR8KBisZWqcBOFhCuG1XTYFlFMSB6fxICb
	R4bDEszGfCC0I/DUHBrCsULQNW0PChHyOKxMHmd/kIklJqiyh1O7bqE54a1wgA7W51g==
X-Received: by 2002:a17:907:3ea2:b0:a72:5ca4:3ab0 with SMTP id a640c23a62f3a-a725ca441f0mr59763166b.10.1719212615068;
        Mon, 24 Jun 2024 00:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO0307iRfNltzgMm5kHBwyRy2sdwA7p7tSeSjAYNG5SuUBph2+kEMCjcxSt8DbmBKUed9JmA==
X-Received: by 2002:a17:907:3ea2:b0:a72:5ca4:3ab0 with SMTP id a640c23a62f3a-a725ca441f0mr59760566b.10.1719212614552;
        Mon, 24 Jun 2024 00:03:34 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724a6e4201sm142610566b.132.2024.06.24.00.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 00:03:34 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in FREESCALE QORIQ DPAA FMAN DRIVER
Date: Mon, 24 Jun 2024 09:03:26 +0200
Message-ID: <20240624070326.130270-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 243996d172a6 ("dt-bindings: net: Convert fsl-fman to yaml") splits
the previous dt text file into four yaml files. It adjusts a corresponding
file entry in MAINTAINERS from txt to yaml, but this adjustment misses
that the file was split and renamed.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry to match the four yaml files resulting from this
commit above.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 807feae089c4..6fe301179ed0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8874,7 +8874,7 @@ M:	Madalin Bucur <madalin.bucur@nxp.com>
 R:	Sean Anderson <sean.anderson@seco.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/fsl-fman.yaml
+F:	Documentation/devicetree/bindings/net/fsl,fman*.yaml
 F:	drivers/net/ethernet/freescale/fman
 
 FREESCALE QORIQ PTP CLOCK DRIVER
-- 
2.45.2


