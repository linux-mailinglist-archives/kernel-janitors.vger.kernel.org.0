Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC12B115D54
	for <lists+kernel-janitors@lfdr.de>; Sat,  7 Dec 2019 16:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfLGPdq (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 7 Dec 2019 10:33:46 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51090 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfLGPdq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Dec 2019 10:33:46 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1idc5Y-0006yj-3T; Sat, 07 Dec 2019 15:33:44 +0000
From:   Colin King <colin.king@canonical.com>
To:     fwts-devel@lists.ubuntu.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH] cpu: microcode: remove redundant check on pointer entry
Date:   Sat,  7 Dec 2019 15:33:43 +0000
Message-Id: <20191207153343.112887-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for a null entry is redundant as the while loop
also checks for this.  Remove the redundant check. Cleans
up cppcheck style warning:

src/cpu/microcode/microcode.c:203:14: style: Condition 'entry' is
always true [knownConditionTrueFalse]
         if (entry &&

src/cpu/microcode/microcode.c:202:32: note: Assuming that condition
'(entry=readdir(dir))!=NULL' is not redundant

 while ((entry = readdir(dir)) != NULL) {

src/cpu/microcode/microcode.c:203:14: note: Condition 'entry' is
always true
         if (entry &&

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 src/cpu/microcode/microcode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/src/cpu/microcode/microcode.c b/src/cpu/microcode/microcode.c
index 974fdec9..65abe50a 100644
--- a/src/cpu/microcode/microcode.c
+++ b/src/cpu/microcode/microcode.c
@@ -200,8 +200,7 @@ static int microcode_test1(fwts_framework *fw)
 
 	/* Scan and check */
 	while ((entry = readdir(dir)) != NULL) {
-	        if (entry &&
-		    (strlen(entry->d_name) > 3) &&
+	        if ((strlen(entry->d_name) > 3) &&
 		    (strncmp(entry->d_name,"cpu", 3) == 0) &&
 		    (isdigit(entry->d_name[3]))) {
 			char path[PATH_MAX];
-- 
2.24.0

