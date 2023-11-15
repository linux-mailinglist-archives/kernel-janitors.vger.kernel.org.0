Return-Path: <kernel-janitors+bounces-161-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFF7E19F5
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 07:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E52A82812AA
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Nov 2023 06:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FE0B657;
	Mon,  6 Nov 2023 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F512F3D
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 06:08:32 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 45D38B6;
	Sun,  5 Nov 2023 22:08:30 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id A1A70602AB5FF;
	Mon,  6 Nov 2023 14:08:27 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sergeantsagara@protonmail.com,
	ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] HID: wacom_sys: add error code check in wacom_feature_mapping
Date: Mon,  6 Nov 2023 14:08:16 +0800
Message-Id: <20231106060815.104971-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hid_report_raw_event() can return error code like '-ENOMEM' if
failed, so check 'ret' to make sure all things work fine.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - report the returned error (Rahul Rameshbabu) and __func__.

 drivers/hid/wacom_sys.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 3f704b8072e8..899579c6db9d 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -320,6 +320,9 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 			if (ret == n && features->type == HID_GENERIC) {
 				ret = hid_report_raw_event(hdev,
 					HID_FEATURE_REPORT, data, n, 0);
+				if (ret)
+					hid_warn(hdev, "%s: failed to report feature: %pe\n",
+						 __func__, ERR_PTR(ret));
 			} else if (ret == 2 && features->type != HID_GENERIC) {
 				features->touch_max = data[1];
 			} else {
@@ -381,6 +384,9 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 		if (ret == n) {
 			ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT,
 						   data, n, 0);
+			if (ret)
+				hid_warn(hdev, "%s: failed to report feature: %pe\n",
+					 __func__, ERR_PTR(ret));
 		} else {
 			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
 				 __func__);
-- 
2.30.2


