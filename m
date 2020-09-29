Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A75A27CCA3
	for <lists+kernel-janitors@lfdr.de>; Tue, 29 Sep 2020 14:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732392AbgI2MiD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 29 Sep 2020 08:38:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbgI2LR5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Sep 2020 07:17:57 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F084208FE;
        Tue, 29 Sep 2020 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601378266;
        bh=uKyd+P7uYdEygJarxNMMYG2W0SFX+OF/GFn1NYnMTTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i0KhnUuSjCO3Q0h4zImKLP/w0uf1SjeUBIcXRcqiiDgTozlQnM8If6suTMuXH4DCg
         zGLMLHGZvmtbmffiIkZAxLDRZeNmANr2LTVcB7cvGHdFKtOolF+md9prIeiLKUyWkn
         ORC1S0DVAgqqzl38HXxd8A6BQgmBnFn0hTpn/Jk0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        David Laight <David.Laight@ACULAB.COM>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Don Zickus <dzickus@redhat.com>, He Zhe <zhe.he@windriver.com>,
        Jan Stancek <jstancek@redhat.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        kernel-janitors@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 089/166] perf cpumap: Fix snprintf overflow check
Date:   Tue, 29 Sep 2020 13:00:01 +0200
Message-Id: <20200929105939.657828029@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929105935.184737111@linuxfoundation.org>
References: <20200929105935.184737111@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit d74b181a028bb5a468f0c609553eff6a8fdf4887 ]

'snprintf' returns the number of characters which would be generated for
the given input.

If the returned value is *greater than* or equal to the buffer size, it
means that the output has been truncated.

Fix the overflow test accordingly.

Fixes: 7780c25bae59f ("perf tools: Allow ability to map cpus to nodes easily")
Fixes: 92a7e1278005b ("perf cpumap: Add cpu__max_present_cpu()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Don Zickus <dzickus@redhat.com>
Cc: He Zhe <zhe.he@windriver.com>
Cc: Jan Stancek <jstancek@redhat.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Link: http://lore.kernel.org/lkml/20200324070319.10901-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/cpumap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/cpumap.c b/tools/perf/util/cpumap.c
index f93846edc1e0d..827d844f4efb1 100644
--- a/tools/perf/util/cpumap.c
+++ b/tools/perf/util/cpumap.c
@@ -462,7 +462,7 @@ static void set_max_cpu_num(void)
 
 	/* get the highest possible cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/possible", mnt);
-	if (ret == PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -473,7 +473,7 @@ static void set_max_cpu_num(void)
 
 	/* get the highest present cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/cpu/present", mnt);
-	if (ret == PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -501,7 +501,7 @@ static void set_max_node_num(void)
 
 	/* get the highest possible cpu number for a sparse allocation */
 	ret = snprintf(path, PATH_MAX, "%s/devices/system/node/possible", mnt);
-	if (ret == PATH_MAX) {
+	if (ret >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		goto out;
 	}
@@ -586,7 +586,7 @@ int cpu__setup_cpunode_map(void)
 		return 0;
 
 	n = snprintf(path, PATH_MAX, "%s/devices/system/node", mnt);
-	if (n == PATH_MAX) {
+	if (n >= PATH_MAX) {
 		pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 		return -1;
 	}
@@ -601,7 +601,7 @@ int cpu__setup_cpunode_map(void)
 			continue;
 
 		n = snprintf(buf, PATH_MAX, "%s/%s", path, dent1->d_name);
-		if (n == PATH_MAX) {
+		if (n >= PATH_MAX) {
 			pr_err("sysfs path crossed PATH_MAX(%d) size\n", PATH_MAX);
 			continue;
 		}
-- 
2.25.1



