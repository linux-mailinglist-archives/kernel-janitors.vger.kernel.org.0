Return-Path: <kernel-janitors+bounces-2405-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990C898248
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Apr 2024 09:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA148B21871
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Apr 2024 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA4A5B5B3;
	Thu,  4 Apr 2024 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnrs/DkW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8ED1CD3C
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Apr 2024 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712216100; cv=none; b=Z245NdV83PQ0akIt7UrYJRi0SGdb04MEkUQfTpS/S5si4zb++8vZZXuJPLnpEGdvXWbKVMghjmtajQNNpNUvzK+aV+LPuVo2dcfwK5qyDzF+/ecUHqr6axgVnf2FYYw1Q5Ps8vJLgxrvIXnlRJWoYI7Ujnr+p8+8NapZVo4Yr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712216100; c=relaxed/simple;
	bh=W7e7+MAaGHn/4hurkaunIgg5XW7NXfDrp6QPkdem9OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjnQXQGxL50Wck1r/UFCyXYQlG/72xjnEpq6ygiu/P2gvUJY/4lovXtnvaKRoZM9IMLilZMd6pjX3EvUojO5o3+R8ZH9eZ/mXOzXqaDOP27FdvYU8c+52cD6ehuyDWpTSn/DUC8XWwzp4sbIoLUlroKRz4ptzsc44/CB645BWiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnrs/DkW; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso619384a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Apr 2024 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712216097; x=1712820897; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vvDcJ9owmc8iAbT8weYpAHg2loA4AsSc9MH9lVIiwo=;
        b=nnrs/DkWGLkcUnFrcBSp1PkLO3s6A5k3KmQ0grKi17XCQqzSTHLrtItsEuZDisMWGo
         EctrGpmi9HkjVKqpcsiiXMLRxAuND4V9nkEelwXZAAJiheftkBQIi3X2f2uSGu1zapPI
         R7VtumxnjFF7eToybgMKC5zhE44rK2IRmASyAEMpae0Ed5qF3ADvpaqdEXuRbQvbndKP
         XpGZ7BYH+51FRMUsPddsu5rIgW728eKI3CjFdXf8JzzRMlEsHwlyVdK5Vq3xta7GWMJk
         s8oeFST5Cf4VrIE76KtxLHLybEctlHqY2foWSMeH1dq5PyzawZIW75iD+Rn/Gjy5KbLm
         +gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712216097; x=1712820897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vvDcJ9owmc8iAbT8weYpAHg2loA4AsSc9MH9lVIiwo=;
        b=YlDV4SoWA9xeXVUEBQ+c+iGtqhHqT5iBk77KuuA2PPbmtbO/0NipsEpi5truLBUlcJ
         7FFZD/+w3/e2o6LBeoFPDFD9EBYWmjEaG2AVxJIZCHUnFETLoLU9IohhPzTHrl5b1ypM
         B/v4fWoRWbN81s8NdbpQbI7oV97pE9ogDc4+qQ+cyWCKmjXQVXWKvb6A2S+R3+IdG/zL
         YQWX+FTg2WcFT6wql8jPL74S7jA0X9jpLsalESn2krlfiJB34z3S3fFIZeIEbIJnS+k6
         otcTWw1MQ6+uJ/uILU8P7hyHiheNyQD2mSBDYjvDMc5SxQHTjnV0gtJYi73Zf+gf+ngF
         JnMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAf2tqcr0Q+03eGnM/+tTJCmY66sBVndpSzqOlCb1lwCjFpqF4xKcNFN7ILWrpxX4LhS6v99AxzKvOzeHVpgr4PAD5sVJYPX+qt0qLk3Rh
X-Gm-Message-State: AOJu0YzeZzn1whVy5txIPvtloUsxzMmOJpMhODgzOdOCLQ0/gSTnFVfj
	WtC/ujM+npmJwlW3MfTDnjJm5sxTlb2ep14Vd1s6vbrdtHkytk3dV6GkqZYzkFM=
X-Google-Smtp-Source: AGHT+IFCHnDsjzPWO/g8+fskkF9IjfvKWtyHSkQJxk4CyAoa2tmcdrKpdgXe07Ln6IRwLPEh3cO7iQ==
X-Received: by 2002:a50:9301:0:b0:56e:22a1:a9a2 with SMTP id m1-20020a509301000000b0056e22a1a9a2mr18956eda.33.1712216097224;
        Thu, 04 Apr 2024 00:34:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g28-20020a056402321c00b0056c1c2b851esm8934205eda.0.2024.04.04.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 00:34:56 -0700 (PDT)
Date: Thu, 4 Apr 2024 10:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Clean up sof_ipc_flood_dfs_write()
Message-ID: <a35dded2-392b-4ccb-9dbb-d782ac9b6547@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function doesn't support partial writes so using
simple_write_to_buffer() doesn't really make sense.  It's better to
just use copy_from_user().

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/sof-client-ipc-flood-test.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index c0d6723aed59..1b2e9e25a836 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -160,15 +160,20 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 	unsigned long ipc_count = 0;
 	struct dentry *dentry;
 	int err;
-	size_t size;
 	char *string;
 	int ret;
 
+	if (*ppos != 0)
+		return -EINVAL;
+
 	string = kzalloc(count + 1, GFP_KERNEL);
 	if (!string)
 		return -ENOMEM;
 
-	size = simple_write_to_buffer(string, count, ppos, buffer, count);
+	if (copy_from_user(string, buffer, count)) {
+		ret = -EFAULT;
+		goto out;
+	}
 
 	/*
 	 * write op is only supported for ipc_flood_count or
@@ -198,7 +203,7 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 	/* limit max duration/ipc count for flood test */
 	if (flood_duration_test) {
 		if (!ipc_duration_ms) {
-			ret = size;
+			ret = count;
 			goto out;
 		}
 
@@ -207,7 +212,7 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 			ipc_duration_ms = MAX_IPC_FLOOD_DURATION_MS;
 	} else {
 		if (!ipc_count) {
-			ret = size;
+			ret = count;
 			goto out;
 		}
 
@@ -231,9 +236,9 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
 
-	/* return size if test is successful */
+	/* return count if test is successful */
 	if (ret >= 0)
-		ret = size;
+		ret = count;
 out:
 	kfree(string);
 	return ret;
-- 
2.43.0


