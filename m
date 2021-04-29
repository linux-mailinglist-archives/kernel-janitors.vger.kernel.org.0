Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9572C36E856
	for <lists+kernel-janitors@lfdr.de>; Thu, 29 Apr 2021 12:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238072AbhD2KEn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 29 Apr 2021 06:04:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39532 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237512AbhD2KEn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Apr 2021 06:04:43 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lc3WU-0004lW-RS; Thu, 29 Apr 2021 10:03:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] initrd: remove redundant assignment to variable rotate
Date:   Thu, 29 Apr 2021 11:03:54 +0100
Message-Id: <20210429100354.58353-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of 0 to rotate is redundant, the value is never
read so it can be it removed.

Cleans up clang scan-build warning:
init/do_mounts_rd.c:252:4: warning: Value stored to 'rotate' is
never read [deadcode.DeadStores]
                        rotate = 0;
                        ^        ~
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 init/do_mounts_rd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index ac021ae6e6fa..8003604dbf90 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -249,7 +249,6 @@ int __init rd_load_image(char *from)
 	for (i = 0; i < nblocks; i++) {
 		if (i && (i % devblocks == 0)) {
 			pr_cont("done disk #1.\n");
-			rotate = 0;
 			fput(in_file);
 			break;
 		}
-- 
2.30.2

