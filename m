Return-Path: <kernel-janitors+bounces-6251-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A99B2C29
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2024 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5499280EE7
	for <lists+kernel-janitors@lfdr.de>; Mon, 28 Oct 2024 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57951CF2AB;
	Mon, 28 Oct 2024 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDKN2hvc"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552831CC88B
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109557; cv=none; b=DFwvd0vzMHqnTTxU4RROzl1YbvXDpsKFD8CNIBIyhIwvKIsbk0+3NHZYjrq2bzBll9GHZy5Sa/ahQhCpsOP5tk5zY1/+D1DQu7ELH7G2TAl/1xWfCA6WYp82DrkrDjU3H72Ff8CsUmHN50AYXSv+NHvjqhl1S4hOoNGTCHjbK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109557; c=relaxed/simple;
	bh=KzaRKoTOmwWQy4AohfkDjioizKXOSufzZc0HObLo+N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JaQVMh7wwXUKS4LefATMXpIMzn7avCzun+VAT9B2Owyg202yx8ShpRQ3YVKORUze7fIaOUpTeBgPNWXk5BnPPSWAAqqAZhwDFN1nsKM7tonA6DMO1OlInEeL7kAiBkv3/fvBmNgxPsYzG8wI4rL4OfPDCI7VL4l4Hfc1sWF2QAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDKN2hvc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730109554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xGoT3W4idt0pQ7dWYy1s/3aPfFUS8vp3/+oiEybPAmM=;
	b=FDKN2hvcGXwakD/ZaS4R14xPuC9ALTGVOqPod7vDFTiRVhKsaw3o6JCB1kqBhQn3okt8NC
	oLrfoXNNoekTtEmoMHJuU23hfq3yWIlTir45ZVAYvjIahKrUzh2CGEuPM+2ZOdOyboqAgf
	EwsOm2dQ+iWocgEjaqyQnZSOQyHNHyA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-2NIDe7lNNKSWPziXAP0HCA-1; Mon, 28 Oct 2024 05:59:12 -0400
X-MC-Unique: 2NIDe7lNNKSWPziXAP0HCA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d533a484aso2446067f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730109551; x=1730714351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGoT3W4idt0pQ7dWYy1s/3aPfFUS8vp3/+oiEybPAmM=;
        b=krT082AcnBkfU+A5V0z5Zml8dG5MU3rEOSHWfsT3aYCG4wnabiAta5uG3QPRzPhsxt
         cfWKfqldQY0DbZMtJUwfi3VPP6rNnVkuzcZkGgmq/SqIHAMrnPc2znkUjtizsaeLjbxa
         MmKLDiz76yVIRqFr/NiBoOBjNwdHroJj7AGWYhWjJRSsP2H+oPARO+J34H1jS6ZFoaba
         1B386wHz3+jftxbOHBvnvEczDOKcYDmcPXIXcVgKwxgAJXMc6hAOjNp9/I7MNYxVqwaC
         8XM7wB9Vk1V0usTmZ6/qGQZrzhjyPUKq/A+o0xy7h2RDaSbYezld1QJDFBYOEnJM+P3w
         JI3Q==
X-Gm-Message-State: AOJu0YzxB47ESjQpSwCVj2VgPfLBTe9d0LOUjT4SweogQqC7haRIcbBu
	40Ofs7b/GAmKZRiqQrlgyZw2m3vcsOdEA/NnZ9QJ2Rtu4XEKliNYsE6jIlQghMS7bCzfFuYkURl
	qaGfMhgG8MIJc2OJoVejPNcemAfxkKGUSbvusf6IEcqR8fh0Ni2AhCfJvsHsxWCBqAA==
X-Received: by 2002:a5d:4003:0:b0:37d:43d1:2064 with SMTP id ffacd0b85a97d-38060f571damr5725713f8f.30.1730109551647;
        Mon, 28 Oct 2024 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOEj+ZEttJYo3NZ6G3iW20Ip5TLN8eBYp6Av97jTXWOgan0CeJqsrWMsD/uXYdf5+ZxKG6Og==
X-Received: by 2002:a5d:4003:0:b0:37d:43d1:2064 with SMTP id ffacd0b85a97d-38060f571damr5725692f8f.30.1730109551320;
        Mon, 28 Oct 2024 02:59:11 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3ba7fsm9055827f8f.34.2024.10.28.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:59:10 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ARC: fix reference of dependency for PAE40 config
Date: Mon, 28 Oct 2024 10:59:07 +0100
Message-ID: <20241028095907.30224-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d71e629bed5b ("ARC: build: disallow invalid PAE40 + 4K page config")
reworks the build dependencies for ARC_HAS_PAE40, and accidentally refers
to the non-existing config option MMU_V4 rather than the intended option
ARC_MMU_V4. Note the missing prefix in the name here.

Refer to the intended config option in the dependency of the ARC_HAS_PAE40
config.

Fixes: d71e629bed5b ("ARC: build: disallow invalid PAE40 + 4K page config")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 69c6e71fa1e6..ea5a1dcb133b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -473,7 +473,7 @@ config HIGHMEM
 
 config ARC_HAS_PAE40
 	bool "Support for the 40-bit Physical Address Extension"
-	depends on MMU_V4
+	depends on ARC_MMU_V4
 	depends on !ARC_PAGE_SIZE_4K
 	select HIGHMEM
 	select PHYS_ADDR_T_64BIT
-- 
2.47.0


