Return-Path: <kernel-janitors+bounces-7755-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD4A936CC
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Apr 2025 14:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33A321B6506F
	for <lists+kernel-janitors@lfdr.de>; Fri, 18 Apr 2025 12:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC95274FC5;
	Fri, 18 Apr 2025 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwF+2W0d"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7916D4E6;
	Fri, 18 Apr 2025 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977820; cv=none; b=OAGFmYm+NmlDRCwztOX8PjyO5oc30BjVGdYKW5m4eosw1jUbaMNC4NYN1VL0OqRYZtQgIFfvWQ6/3l7PZSheiShViuNlsFVNCs/j5QgSAQ11qXrPxktRPTNuDnCEXorRom5I0tBFSjSUpRi/NjxUZ8rQms18h32eKMJ51d77oHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977820; c=relaxed/simple;
	bh=GCAaP2+eMhfUK6n+4NMxhLdL3oro7ICzZjWNUc+/L0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PrMJurHITJx5Hl1hW0gcE99G9YONDEPMMbXxgeSiEcLuZhN3tVLPT6v/KlUCVTccirUOKGHLN5y2y/YEakiySYuH5tzfKBR1A8FviD6ssRvMSu1Kx7JtokxGIyCsw7F/Qb0x2k4npL8O1CI+amy/8U+IUp8c+02Xav0r1V4f/as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwF+2W0d; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1172772f8f.2;
        Fri, 18 Apr 2025 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977817; x=1745582617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzDXI54x1X0eS48ybGkFqIAbabffOZuzEsqDECgMj8s=;
        b=kwF+2W0dU2bdwtNtXXp+9VUz7EdWS9wENJvoTt/o+23qCKFA0ydbU3tKR6JkqPIhl3
         wTCWcstO1Fhal7lkSpEi3e5AXTak2Qz7TNhv4F+OAnzZQA+XBOherj+BS1An8bXA1ufq
         +SvlCKz2SFGWDPGbUA6IwqCYMm2SPKyC9V/bsIpwxaDZQj6fTYwY1w0Am8y+DhoHh6DP
         NKLJDpPum6BVSuAq4xPf6YHWYdCP4h4AHYSdvfve5gD/Jff3BjTULRocWFhS4uIbb/fn
         ufw6vNJS9KU4n6pTAdc50rMJ+sEW0hZbMJmPwqJIn329Aygwhvhre3aMWnTOzxs1RIPm
         WQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977817; x=1745582617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzDXI54x1X0eS48ybGkFqIAbabffOZuzEsqDECgMj8s=;
        b=d5703lyqpBpDP62aLO1yDbQueJUkmLjpjKrdT7TzceHvHSgETMiuR8wydtLe1hlXXx
         Uc+PKhKau7qKdcQBSHdaRavn9kfK/QUt4mSZZkcq/zgLIcn1TMDmNfORZwrfS0nNkBV2
         l3YXUt097afHrWSuy69HkdCcvtT1pkSa2ugqa4f9NU82mp/APF6+QFDfoxx8RCdabQ+w
         tqUNrVW04X2p0hENtnuHIK0Ca3wg7jq8/jn8WBCDZZ9VNYblUfdLQUA4AavUyl0VY5CY
         LdKukT6/+qunYmM1UfKn5yBQz8xxpHbFVvnUbB2o/NBcRoldsMF4p/i3dWX+0B5/n5e6
         yqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuSfg+PoBSWUzUAVKgRzCGiWsS8j61NbdczsJVIfwsUxag+PrZ+Fkp57hb++YJHbCYmgRBMqYPv8BK7+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmA1ywkxqLoWAZM2I4Y52b2nBii7qZDQHP46o6C958G74bc1RJ
	o/efqdiRpzFihmnHL7ulMQB8AmXrpnVY9R2xshlfy392L3Mb7aFy
X-Gm-Gg: ASbGncuIOmYmZjVDQ6M6Mfdhfwg0LYqVBmD9qTEbaxgLmaqQkJd43wt9ELCCf0UMM0e
	xQPIOGs6w+SgMwYyMAhb/4wGmGpTl7NQ4ns49nDYWF3J+PamB4qQEg6nQ97EbaNrJkdTF3+8m0N
	/wapxisYs2IMOYRPzV/pFLnCHwcKywS+cLpaMZ2kpQJNJevD/TuXNhXuXbiBo2A1cPjLfFC7p/f
	x+ghLBev9RbHrQIh9iK+Ws6zxC+fRfxxzx9GJPOGi/ycxZdJiQKusY3fUWzzJah32OsMn8mJXbZ
	wZ6QgHkW7e9zOkbD7EpzxGscDWktS166iJ90eBLpWA==
X-Google-Smtp-Source: AGHT+IEUD6k4QSc4ti7eTCFJXkgL+r1yKTaYIn7Oc+8OU8G5Fg7lgwr9Er+zG0ZcUkbsPplX9I1p4g==
X-Received: by 2002:a05:6000:400d:b0:39c:cc7:3c5f with SMTP id ffacd0b85a97d-39efbae03a2mr1985961f8f.45.1744977817031;
        Fri, 18 Apr 2025 05:03:37 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4931e7sm2586839f8f.67.2025.04.18.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:03:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crash: Fix spelling mistake "crahskernel" -> "crashkernel"
Date: Fri, 18 Apr 2025 13:03:31 +0100
Message-ID: <20250418120331.535086-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 kernel/crash_reserve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index aff7c0fdbefa..acb6bf42e30d 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -131,7 +131,7 @@ static int __init parse_crashkernel_mem(char *cmdline,
 			cur++;
 			*crash_base = memparse(cur, &tmp);
 			if (cur == tmp) {
-				pr_warn("crahskernel: Memory value expected after '@'\n");
+				pr_warn("crashkernel: Memory value expected after '@'\n");
 				return -EINVAL;
 			}
 		}
-- 
2.49.0


