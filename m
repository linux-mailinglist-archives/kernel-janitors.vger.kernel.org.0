Return-Path: <kernel-janitors+bounces-1197-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40482A05D
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 19:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDA51F22D67
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jan 2024 18:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBEB4D58B;
	Wed, 10 Jan 2024 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmQ7WIj2"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010B41A86
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e549adb7dso16624425e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912119; x=1705516919; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3HxkPxdBK1lXd88gyjH7DsIkkBoMbuVmr437RwfE1I=;
        b=FmQ7WIj2Qb/it2bvlvsFv23+BrZxrEavTAm9V7+geJw/r1oN+vzQTFXPD5B5iKcR8k
         sdm/HLpaWdJBfXIB64u1ECAWu5DqhjFOsjqKiul05tal/0C3s7OG7mJwvROCcvOGXbP/
         PbuftZU1sIUdtgN+iYz+CHv76GfvF1MOwJwthCCvX/U2dkSaSiwbehTKBZWJSffuc+y5
         DftTx640Bl15uewmFBh9ZdsXIHPjJsw0nLoOHsonvENtvOjPIanANqeAVdi14fArPoiy
         9OEVRkdqa45FrybwzsJ1u5JJm3pTroGA+vly/uSus4bcTG01JsDHmW45XK5LunM4OIeG
         PBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912119; x=1705516919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3HxkPxdBK1lXd88gyjH7DsIkkBoMbuVmr437RwfE1I=;
        b=J/Nma7vn+fK31Q7S0lKoZhxOpozWNGj2RIWnQIFQqCQliazx46orthOBXpq/Ls7NbC
         cj/YwxLgczfC2CBG8+gnZkRnXZq8jBMbr87QrLgOkgxVgjl6JrYPEYXJd3YS5za4HO+y
         jAkiO01RVkzzEEGr2I/M23ZP2LgbsDcuUSRK/cvmm8zxXvuFXAR6KqOXzPt9V4IEHzZP
         D4O4ywvj8I33JdVdiSVXYA3Dqnpk7VZibs2MGKnLRAYHHcP3TGDCHdJFS8r6serMTJWl
         5OR+sisqMPI1t03RByFAhOx7mxynNgK1zFUMRIP6MzHukc5eA1VUMpBWmkEgn7tu+OrX
         DdRA==
X-Gm-Message-State: AOJu0YwpSeeMgjGq6o2pFOFwSm+MCzZMhDNlkVigK32FQ1z02YivdPSy
	XDwvQ6xDFE8Fs51RgenyFwap/IBrPuFRzA==
X-Google-Smtp-Source: AGHT+IES+g1sC7b6OzWxWSSixdTsH+FX0WM6FCEUVb4ZC/UPgLyUuJv1+Fl18jMeM7lrniunOBA7jA==
X-Received: by 2002:a05:600c:4e8f:b0:40e:4b48:57d4 with SMTP id f15-20020a05600c4e8f00b0040e4b4857d4mr689256wmq.180.1704912119155;
        Wed, 10 Jan 2024 10:41:59 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id n40-20020a05600c3ba800b0040e541ddcb1sm3081607wms.33.2024.01.10.10.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:41:59 -0800 (PST)
Date: Wed, 10 Jan 2024 21:41:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Arulprabhu Ponnusamy <arulponn@cisco.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: fnic: unlock on error path in fnic_queuecommand()
Message-ID: <5360fa20-74bc-4c22-a78e-ea8b18c5410d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call spin_unlock_irqrestore(&fnic->wq_copy_lock[hwq], flags) before
returning.

Fixes: c81df08cd294 ("scsi: fnic: Add support for multiqueue (MQ) in fnic driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/fnic/fnic_scsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/fnic/fnic_scsi.c b/drivers/scsi/fnic/fnic_scsi.c
index 4d6db4509e75..8d7fc5284293 100644
--- a/drivers/scsi/fnic/fnic_scsi.c
+++ b/drivers/scsi/fnic/fnic_scsi.c
@@ -546,6 +546,7 @@ int fnic_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *sc)
 	if (fnic->sw_copy_wq[hwq].io_req_table[blk_mq_unique_tag_to_tag(mqtag)] != NULL) {
 		WARN(1, "fnic<%d>: %s: hwq: %d tag 0x%x already exists\n",
 				fnic->fnic_num, __func__, hwq, blk_mq_unique_tag_to_tag(mqtag));
+		spin_unlock_irqrestore(&fnic->wq_copy_lock[hwq], flags);
 		return SCSI_MLQUEUE_HOST_BUSY;
 	}
 
-- 
2.42.0


