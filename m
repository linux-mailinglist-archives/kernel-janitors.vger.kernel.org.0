Return-Path: <kernel-janitors+bounces-356-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1A7F2474
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 04:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3D3AB21A77
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Nov 2023 03:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E5714299;
	Tue, 21 Nov 2023 03:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
X-Greylist: delayed 185 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Nov 2023 19:02:30 PST
Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39F63BC
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Nov 2023 19:02:29 -0800 (PST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2655c1d09f85-7c2b4;
	Tue, 21 Nov 2023 10:59:21 +0800 (CST)
X-RM-TRANSID:2ee2655c1d09f85-7c2b4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.54.5.255])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee7655c1d082ed-c5454;
	Tue, 21 Nov 2023 10:59:21 +0800 (CST)
X-RM-TRANSID:2ee7655c1d082ed-c5454
From: zhujun2 <zhujun2@cmss.chinamobile.com>
To: kernel-janitors@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com,
	ivan.orlov0322@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] selftests/media_tests: fix a resource leak
Date: Mon, 20 Nov 2023 18:59:18 -0800
Message-Id: <20231121025918.2570-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8431b227-d053-4a9a-a278-2a43753fdaf7@efficios.com>
References: <8431b227-d053-4a9a-a278-2a43753fdaf7@efficios.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>

The opened file should be closed in main(), otherwise resource
leak will occur that this problem was discovered by code reading

Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>
---
 tools/testing/selftests/media_tests/media_device_open.c | 3 +++
 tools/testing/selftests/media_tests/media_device_test.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/media_tests/media_device_open.c b/tools/testing/selftests/media_tests/media_device_open.c
index 93183a37b133..2dfb2a11b148 100644
--- a/tools/testing/selftests/media_tests/media_device_open.c
+++ b/tools/testing/selftests/media_tests/media_device_open.c
@@ -70,6 +70,7 @@ int main(int argc, char **argv)
 	fd = open(media_device, O_RDWR);
 	if (fd == -1) {
 		printf("Media Device open errno %s\n", strerror(errno));
+		close(fd);
 		exit(-1);
 	}
 
@@ -79,4 +80,6 @@ int main(int argc, char **argv)
 	else
 		printf("Media device model %s driver %s\n",
 			mdi.model, mdi.driver);
+
+	close(fd);
 }
diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
index 4b9953359e40..7cabb62535a7 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -79,6 +79,7 @@ int main(int argc, char **argv)
 	fd = open(media_device, O_RDWR);
 	if (fd == -1) {
 		printf("Media Device open errno %s\n", strerror(errno));
+		close(fd);
 		exit(-1);
 	}
 
@@ -100,4 +101,6 @@ int main(int argc, char **argv)
 		sleep(10);
 		count--;
 	}
+
+	close(fd);
 }
-- 
2.17.1




