Return-Path: <kernel-janitors+bounces-7565-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A8A6473F
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Mar 2025 10:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EF716F92F
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Mar 2025 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556FE224B03;
	Mon, 17 Mar 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqzXzOEN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEE221F3A
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203651; cv=none; b=KzApa8o+Kw3Msys8br7cbh/QuRpPV0QKAtHo3ZUZhMrgu/+YvBB2Ddd7rsUWmchKrcCL54JwalcrkIzO0Rrod26vJZ3LxG9JirQoFj090Cx/HuKf7OqoxkYZBffhER8/AAV+i/Gk3Nbo/MN3Q4NR4udKHiuKfUhnXAW6zI240o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203651; c=relaxed/simple;
	bh=wc8ZUJs4juXlpOzJC3dYvkAmWROYc3NkYrmr2+p4WQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZJvhDMTGDQPXMf/SD4KE8jS1BzNXDDoW0PfgSatTvum6xK3zf/iWu6WNT7O0Siwi3i0FMEIjXXxgmnv9ZSkTifyC/ncNSMwBRouD+2Zg4lD+D42RENYEpUKn1K1JRcRvncBQkIxFQk6G81zJuRBcShbg4wU+Ubc2lQgzCqQELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JqzXzOEN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742203649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ELVb8/TgPP99S2US6QOwfM5yFjDUVc6XvoMzilxTm90=;
	b=JqzXzOENl/divQG6HdzNRe7hqNPkqFSTmE9VLeCGBdu99M20gdyvVylDgV9Y/d7yOeeqB6
	+Rr3xECxp+dTFDojgqShkjhfbqEa2/0RL1dS9IA8ISBATAe7pFZjAW0BAPeIMHzkY3Iwse
	KAay0we3Mz7kJHSo91eXrzQOzyKy3ZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-Jqlnjo48NUe8eb7T6b1Jmw-1; Mon, 17 Mar 2025 05:27:27 -0400
X-MC-Unique: Jqlnjo48NUe8eb7T6b1Jmw-1
X-Mimecast-MFC-AGG-ID: Jqlnjo48NUe8eb7T6b1Jmw_1742203646
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso21127635e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 02:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203646; x=1742808446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELVb8/TgPP99S2US6QOwfM5yFjDUVc6XvoMzilxTm90=;
        b=VxfL8tEAYLrB2UNfx/QWz5kV1cZFXVC+OUdSVD0NjQ5E4mpgeuAbfcXRAVY1wRlrwr
         5kwXsa7lqLaNbvX6iq5bvM7bICJDdAR6s1hMYNXrP+09NLpLO12fO+ESrDlELOkz0wxZ
         287KccR+cX4zjPx069eItYZUvszG4eoV4YhLbZZII47u3BPyQ4OFUC2CftSGatzTYJoS
         xt0ohkCFey6URB4ITUDudTaFZjLnj42kCusZYwKp9lEPgmE6c6MmPNuU9AySl2O8s2ss
         sKwcFuVl/mQEcvKooeJSB7G5EN+OMTdZMCYoIrFP7vxJ4wCOeVnVUct5hd+izQjRbyji
         ICSA==
X-Gm-Message-State: AOJu0Yzk6+NfRnnuEdamcJ1DG8bXWtrttpPv2jef7F1HnI9KfhtNkctm
	EE43/2n0y/cHxB2rpwkQ3qsfSlpSe/fhAY3zPC5RLV61xwoWkzcgCPXVcZV7/QHulsNk8ed/kWC
	JzCC2iPu6ijtgVpdr0jCjHJ+baMyhHwbqtj7Dv9m9oMnMpGQ4SQ2ZMDViG7sR8Gvjug==
X-Gm-Gg: ASbGncsEv0yauZ/mZRQCxvzcFD7koAxeD6L+XKCLjeYcfJyw5Z8fqwwISVDxzyuRHc/
	8hHnIh7jRKure1t72qBzc9N+vAdbgeRLfHGVN670I/++kvxAvg+SY5J725dKxHPmkTSMQBWJB/t
	bN5v+AunZpzBArOLG9GosaLBx9q5MDMLjlv5ZuyGNqPKbKmDJ4KKrba5+Tv4tb0vn3kTrEK547b
	KDjx8X/Al/eUPjK91xInEYmghGh625J777D2pYzUSmxFtROSY5f4oBr9fverwRQlA/yFpij+Mrg
	bPtCrE+wVpvZfNl4ZwRdJmexlzweLn8CXbaxiW5cpn00ZynQJnjrs2p+s54b+zs=
X-Received: by 2002:a5d:5f84:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3971e3a54cbmr14547810f8f.31.1742203646499;
        Mon, 17 Mar 2025 02:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRgjJ/x/oVlKZKHU7TipAkeP19C9rZyh+PBBydQPPRm8QgqfVoTWGnhCYtv13jfPOOqNUncg==
X-Received: by 2002:a5d:5f84:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3971e3a54cbmr14547775f8f.31.1742203646117;
        Mon, 17 Mar 2025 02:27:26 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3506sm14795571f8f.11.2025.03.17.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:27:25 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chao Qin <chao.qin@intel.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH net-next] MAINTAINERS: adjust the file entry in INTEL PMC CORE DRIVER
Date: Mon, 17 Mar 2025 10:27:17 +0100
Message-ID: <20250317092717.322862-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 7e2f7e25f6ff ("arch: x86: add IPC mailbox accessor function and add
SoC register access") adds a new file entry referring to the non-existent
file linux/platform_data/x86/intel_pmc_ipc.h in section INTEL PMC CORE
DRIVER rather than referring to the file
include/linux/platform_data/x86/intel_pmc_ipc.h added with this commit.
Note that it was missing 'include' in the beginning.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
I think the commit above is in net-next, this patch is to be applied
on the tree where the commit has been added.

Jakub, please pick this minor non-urgent fix. Thanks.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ae7f628da4..9544a4e84f99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12069,7 +12069,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
 F:	drivers/platform/x86/intel/pmc/
-F:	linux/platform_data/x86/intel_pmc_ipc.h
+F:	include/linux/platform_data/x86/intel_pmc_ipc.h
 
 INTEL PMIC GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
-- 
2.48.1


