Return-Path: <kernel-janitors+bounces-415-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE887F5CBA
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Nov 2023 11:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2011C20D2B
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Nov 2023 10:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20FC21106;
	Thu, 23 Nov 2023 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8UNCOjW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D058D44;
	Thu, 23 Nov 2023 02:45:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ffef4b2741so89085166b.3;
        Thu, 23 Nov 2023 02:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700736302; x=1701341102; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6Hvqdct8bxNPtyyQ9oB1GOQ6etl7woaugTWazlBaUY=;
        b=N8UNCOjW7t06vZRFj1C6q8FDXhnWe1zS1fL1MEOACe8Z1QYnT2BdvDvXE4tnsKjVQb
         qBYPgL2Ryhqo8SXEwARwXcZUTYq2PGVdGRGQypo5/y6fQ7bupWPVFkeeeXfb0FlU+m7F
         SNvrTPiKL3GZEfOMO6wCdQFUPJmThxPUgYQMCjCLhFehlAGmz24LMAnBOeIAW46tUGka
         3j9VoHSYoG8+IoDEmWXHKVpqap2s5TCevjgnaOS3mcOrrVhSIeUPZA9y4sQdQTsi//tT
         MkHjaaV9PkG1nYXKxY71aLBHgHREvB0Ct57XBuADAsKxXI/x3WFY1Pm5UhDJi7F1Uues
         LlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736302; x=1701341102;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6Hvqdct8bxNPtyyQ9oB1GOQ6etl7woaugTWazlBaUY=;
        b=phZvxomDiaHLcO+0dJNz2OKMBmZ9Grl59dnPaONiVYzbAZ4IohWGjHkdIRZNnxBICe
         La2xYPw9l1A59KpHnxfGeQLF5ed/SXTP2ZhmxihQV+u3NJ4nbOyacfj87VpNp3AK3Zf7
         nGMTbXUzQNN37JxILSg1aQrKe8Frs2OwSsL7n8GgPwrzHYimQ6+7q4VHp/pY/A2LVj9V
         BksyYNZdOvEV62rW6W6aVyAoAWHoCWjIoiBmi7B7SKm07BI5P0Hs2/g0YCFrwDOgz+70
         XfLaOhqQ4+ztNTnQRNk+wflHXqRc8nItoSYum5MwKluLZnZzK+pf/ujKzeMHRyFcGsdc
         7lZA==
X-Gm-Message-State: AOJu0Yxu6ts9UyWjQCXDXqJmzRYluhzhwDB3Drm02Sp8rHirGe5acKc2
	3e0fFoVlLxz/5AQ9MWRUeDpYeddU/ig=
X-Google-Smtp-Source: AGHT+IGiUlWLCvVUZKgKbPhov7AohPU1as4zFqqjJjOyNpm6BCPLWiZ1YP03S1NxT2INoF41F8DmkA==
X-Received: by 2002:a17:906:530b:b0:a04:b801:66f7 with SMTP id h11-20020a170906530b00b00a04b80166f7mr2514382ejo.23.1700736301191;
        Thu, 23 Nov 2023 02:45:01 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:d183:a5d9:39a9:cd13])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090668d200b009fc95fc3dabsm617552ejr.130.2023.11.23.02.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:45:00 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] arm: drop an obsolete ifdef with the removed config PCI_HOST_ITE8152
Date: Thu, 23 Nov 2023 11:44:58 +0100
Message-Id: <20231123104458.22569-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

Commit 6da5238fa384 ("ARM: 8993/1: remove it8152 PCI controller driver")
removes the config PCI_HOST_ITE8152, but left a dangling obsolete ifndef
in ./arch/arm/kernel/bios32.c.

Hence, ./scripts/checkkconfigsymbols.py warns:

  PCI_HOST_ITE8152
  Referencing files: arch/arm/kernel/bios32.c

Remove this obsolete ifndef.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/kernel/bios32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index d334c7fb672b..1b7aa85d3bec 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -527,12 +527,10 @@ void pci_common_init_dev(struct device *parent, struct hw_pci *hw)
 	}
 }
 
-#ifndef CONFIG_PCI_HOST_ITE8152
 void pcibios_set_master(struct pci_dev *dev)
 {
 	/* No special bus mastering setup handling */
 }
-#endif
 
 char * __init pcibios_setup(char *str)
 {
-- 
2.17.1


