Return-Path: <kernel-janitors+bounces-5040-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9662952D7E
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2024 13:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 635FDB20E20
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Aug 2024 11:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826A117A598;
	Thu, 15 Aug 2024 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1JqzpUG"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD114A084
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721353; cv=none; b=UhI7KEEZqyJsRoOGhtOfm3Ivi7nyz+LHhxCYLXx+xp5VWg0SA3l9zF/0PRO/qhJpXwBe01QnabBpR2F0huHdzLrdSBJ1q6FgOfDE0TFk1FSLU084o5jDpULsRhbjMJhzrMav2QTdfuDmDQk4YWgE5/AJKULGGfZ4pXoNYRyhbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721353; c=relaxed/simple;
	bh=5yq7ytwNHn2qEvgK7GpGxCanu4fLp9NgxjldEljV6Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TaJO0is5mPaQWS3bmHRWEDTeG3j+c7pvwYMExKzXx1HZpJZXJLWUL4OXJV1yfWbjBDIZyTzSwAjoJCnr4QPUDdLisZezXpBslugKuzKarjREr/xJkL95lQM7h1Kmpk8EnTwOCzWeh6P+Zu8XsE+nPoJHruYdXAQK8GJae747vos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1JqzpUG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bba25c1e15so1189194a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 04:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723721350; x=1724326150; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54Zuy7nrqOr7HzwudR7mUSOwh6Bt+KzFm1OF0/li1xk=;
        b=s1JqzpUGhteq3nJA6TbhRNhk945JVTr+EAbdJpJ9lSNj54j75VdexDFqAlu1cQ97I/
         d0usb0OOAjR0jJkeBlL00zTFyQ3rx5qb3KKCr1QGx0LzkUNbovs9sBd8+uP3on+zwWJa
         2tSLlG9hSVyeD2c2IvS5NDPsMGkdzjKNLMEbGQnUMaLYm93FVQS1iZNETVUXL0cAPqQq
         +l9c5kdJC6ahjxpmSprYeWyjF+PEEs+OM3kXab0HDiQOFgnveks6Q4j1PuENI92pIMFJ
         WuTolzzfTJyLN5y08TR0Hc2QFSY/GlfLNv1KwdZds9kTeEiuUyC4KvVkOZ//q4pF0Bwb
         A+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723721350; x=1724326150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54Zuy7nrqOr7HzwudR7mUSOwh6Bt+KzFm1OF0/li1xk=;
        b=nHPuHtAUEe1Pp/IlLZ6UZojJ3LDoRa+mbVnRhvMbTcQX06LHpVZ12j32Ljrp+M5B1t
         xQKVyf/DtRN1V/E1YQanEpJ27kKl9ZXUAaW0ZgIUEoSRog95ZeMPCD6El81770cOZXSJ
         wjNol97PCvP8WlLqBUgzQThvIVpb9tnW1kpQl6TMdAHVhxn6ino9inFXnW9CEXBpH2JJ
         qPP1V8OAhOXxydaHoOtnO17rZczLWpTdJdAdPMn23JtnrGieTeveAJb1ugz/3XDoECo5
         x5d/IwmbgVCau5u3Bq4r6UMiEPjlVMFCShyxjtZON58G+LNMm2zWMaEHRUP6h4GHvHr3
         F03A==
X-Forwarded-Encrypted: i=1; AJvYcCXlLRV8Sqcb4ZS9Cc841ykJM2d7ATnEY6RMDGxCNXg1Yw3qvy8vrPvElWDYlJIdv52CbMMFEb+DHYEz+ywCocPnDpf6ycmgJv4j0Jx/JHKy
X-Gm-Message-State: AOJu0YzT0nc6Rr1UDM1UhcM8AV6BMWFuSy92OOw8YT++txa6am6J1paO
	po17YAx/GOQFF+z6jBSbNHQME4hZb5r5qAQSB4Iw3eDQLNZWPUmf9VXameNMHBk=
X-Google-Smtp-Source: AGHT+IHodIlI/PTrXRzPvp5z7NIYGt15OMaZASUJrA7ZoG5lrLvhWQzVLdVc0XUqFxReFzqVCQiEnA==
X-Received: by 2002:a05:6402:e81:b0:5be:9d95:3910 with SMTP id 4fb4d7f45d1cf-5bea1c7b6efmr3910351a12.22.1723721349606;
        Thu, 15 Aug 2024 04:29:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe26f1sm802131a12.3.2024.08.15.04.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:29:09 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:29:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Smart <jsmart2021@gmail.com>
Cc: James Smart <james.smart@broadcom.com>,
	Ram Vegesna <ram.vegesna@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Daniel Wagner <dwagner@suse.de>, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: elx: libefc: potential use after free in
 efc_nport_vport_del()
Message-ID: <b666ab26-6581-4213-9a3d-32a9147f0399@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kref_put() function will call nport->release if the refcount drops
to zero.  The nport->release release function is _efc_nport_free() which
frees "nport".  But then we dereference "nport" on the next line which
is a use after free.  Re-order these lines to avoid the use after free.

Fixes: fcd427303eb9 ("scsi: elx: libefc: SLI and FC PORT state machine interfaces")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Untested.  But it seems low risk.
---
 drivers/scsi/elx/libefc/efc_nport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/elx/libefc/efc_nport.c b/drivers/scsi/elx/libefc/efc_nport.c
index 2e83a667901f..1a7437f4328e 100644
--- a/drivers/scsi/elx/libefc/efc_nport.c
+++ b/drivers/scsi/elx/libefc/efc_nport.c
@@ -705,9 +705,9 @@ efc_nport_vport_del(struct efc *efc, struct efc_domain *domain,
 	spin_lock_irqsave(&efc->lock, flags);
 	list_for_each_entry(nport, &domain->nport_list, list_entry) {
 		if (nport->wwpn == wwpn && nport->wwnn == wwnn) {
-			kref_put(&nport->ref, nport->release);
 			/* Shutdown this NPORT */
 			efc_sm_post_event(&nport->sm, EFC_EVT_SHUTDOWN, NULL);
+			kref_put(&nport->ref, nport->release);
 			break;
 		}
 	}
-- 
2.43.0


