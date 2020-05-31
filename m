Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0947A1E9723
	for <lists+kernel-janitors@lfdr.de>; Sun, 31 May 2020 13:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgEaLAZ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 31 May 2020 07:00:25 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:55996 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbgEaLAW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 31 May 2020 07:00:22 -0400
Received: from localhost.localdomain ([93.23.14.245])
        by mwinf5d05 with ME
        id lP0H220095HDzGl03P0He9; Sun, 31 May 2020 13:00:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 31 May 2020 13:00:20 +0200
X-ME-IP: 93.23.14.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
        paulmck@kernel.org, gregkh@linuxfoundation.org,
        mhiramat@kernel.org, dianders@chromium.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] arm64: debug: mark a function as __init to save some memory
Date:   Sun, 31 May 2020 13:00:15 +0200
Message-Id: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'debug_monitors_init()' is only called via 'postcore_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm64/kernel/debug-monitors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 15e80c876d46..5df49366e9ab 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -130,7 +130,7 @@ static int clear_os_lock(unsigned int cpu)
 	return 0;
 }
 
-static int debug_monitors_init(void)
+static int __init debug_monitors_init(void)
 {
 	return cpuhp_setup_state(CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING,
 				 "arm64/debug_monitors:starting",
-- 
2.25.1

