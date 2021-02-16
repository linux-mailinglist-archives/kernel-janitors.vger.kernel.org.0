Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E274B31CB94
	for <lists+kernel-janitors@lfdr.de>; Tue, 16 Feb 2021 15:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBPOJ3 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 16 Feb 2021 09:09:29 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51079 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhBPOJ1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Feb 2021 09:09:27 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lC11x-0000ys-3q; Tue, 16 Feb 2021 14:08:45 +0000
From:   Colin King <colin.king@canonical.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] tracing/tools: fix a couple of spelling mistakes
Date:   Tue, 16 Feb 2021 14:08:44 +0000
Message-Id: <20210216140844.160499-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the -g help option, I believe
it should be "graph".  There is also a spelling mistake in a
warning message. Fix both mistakes.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Also fix "nummer" spelling mistake.

---
 tools/tracing/latency/latency-collector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/tracing/latency/latency-collector.c b/tools/tracing/latency/latency-collector.c
index 57b20802e71b..bfe084bc460e 100644
--- a/tools/tracing/latency/latency-collector.c
+++ b/tools/tracing/latency/latency-collector.c
@@ -1650,7 +1650,7 @@ static void start_printthread(void)
 		if (ufd <  0 ||
 		    read(ufd, seed, sizeof(*seed)) != sizeof(*seed)) {
 			printf(
-"Warning! Using trivial random nummer seed, since %s not available\n",
+"Warning! Using trivial random number seed, since %s not available\n",
 			DEV_URANDOM);
 			fflush(stdout);
 			*seed = i;
@@ -1711,7 +1711,7 @@ static void show_usage(void)
 "\t\t\tbeginning, end, and backtrace.\n\n"
 
 "-g, --graph\t\tEnable the display-graph option in trace_option. This\n"
-"\t\t\toption causes ftrace to show the functionph of how\n"
+"\t\t\toption causes ftrace to show the graph of how\n"
 "\t\t\tfunctions are calling other functions.\n\n"
 
 "-c, --policy POL\tRun the program with scheduling policy POL. POL can be\n"
-- 
2.30.0

