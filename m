Return-Path: <kernel-janitors+bounces-7829-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E813EA986B8
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Apr 2025 12:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F258A1B62BCD
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Apr 2025 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B460269AFB;
	Wed, 23 Apr 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5JysxNU"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C6223DD9
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402673; cv=none; b=kuzZ3li58msdlIuB3mwBM5nE6JNwACc0OQSfYLuNgh8HrQZ7mYieOlQShOOuNF622Yj7qkcgqK28hpRs3OdFCkgSTaMWgO9w0Jiue4vUumdAQAk5Dzbi+zZH0k08Kyn582oiCHD7mW1kcHPeuKSJbeb1BJ68MBlEuAQxPxxJBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402673; c=relaxed/simple;
	bh=zN2CN4xkTt/S1f+JZRhrMo6stvp/vRE0pTjhfBdb6Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZUjWhEekUq2BD4A4rTZwBsFL9q4wEDOu64oK6pcxJrC0yA/tdHynOPkxZ6UPW9VxDXbAQWp0tpX/WD8zvSRUbnudAeMke06x8AK7p6qejryHBB4J9bAhXa8AhA0bhj8gFHpf8/k95+4BTJimLbhClf3Ys0uRdB9erm4T/8vmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5JysxNU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d129c1aso571407f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745402670; x=1746007470; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7YPlI4lY3EOXYAQ25j3bfmun+GWZfjJUrFD09vLfXI=;
        b=n5JysxNUV9kOrtZZwXyJlCB1vObgoSI5YzO030CN9yCRG4wgjrFcZgabsTCszOpsWV
         C8gSKhDYnkKaNsiXTpd+d6mAewxp9K8vpBv0boPKq4q6jcu+Y9vZOlaIZFBWpdaWwN88
         FM8a9mO/F3fT8XtqRkRNS5z/wLtH+wYJeN2h9OGyYTKSMKGE6IkTKX2fEAombzCTue7h
         kJLxrG4OfnSsgeLjc9mBImFZAklLmXTx5W6KaOToIDa26f7vH2yZa/hCcZUsHoRAAH+W
         mf2QkFl+8RiKfBKW9nxVxHF3RjmKitVB5FF1lOPVXmt0v6WjG7i62WOy3a7/lRCdpmjl
         qQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402670; x=1746007470;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7YPlI4lY3EOXYAQ25j3bfmun+GWZfjJUrFD09vLfXI=;
        b=TVZZAwYBif6Vy/jE9QfNWS95/1TsNbpUWG9QOg79uErU0wYgpRoiU7sV9Qlps3cLDO
         5mMywshhA/C58OV7LUDMfzNpe5e9pXQnLKAC2bLBO278niQcQ+7v+cIEuSiv1+FRVzRH
         PXGyelh3vgfqMEy0AJLflde2wY0FkkkEdyCLasgB1ZPy2TugHExV5irPkNTpVzL/XaTJ
         0+G4goT3WIEWk5fzGWq9vxJdqlig6opKqxlOc8i3BXbUlP4vQQjCzpj32Y0A+nIt0Rpq
         Cq03Gb9pkITMDyNjlLDSWgnyROokJY4n3fPJ8HYBbc1q6vb2sXB22HM6CD95901yUieX
         OaTw==
X-Forwarded-Encrypted: i=1; AJvYcCXIW2/cTna7myRXDJhcPxCN6ibMZz+o83gvTx6y+AurRnhKMpRvzdS8lo2TYqcJTomhA2gzzySxe5D5jgxp9sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJmHdSMIFvfih9fWsCpCVB/i8kkkaO2nSCapgQ5YP2hAbSIqw
	WMG3nRG4Wvh9TGXh7uX9olxFVTjP8K90MBRerzEA6xCfdPFgemHSY7RC3idwNGE=
X-Gm-Gg: ASbGncts9AjU8M6TCE7ncTEfJ7yoxq0QLDmKrBWC1u9RjPkfseWL/Jn1a0ncqSRv3oF
	OuKG5iL9kDcFvNx7hKQpuTrIkC0vH35ipKUlPmPLoi0FpuVdXfCjVk55VK14ivDJAJbFT9hoAYp
	KiOYPjU1ruU4RHr2WdCX9co6CVotzcKF9WPK7jbPEVxzlfCPSmjgn5QYyeDHKMQJCsZTG/MnGGd
	Osu57pINjNq5FefIRftK51vpLs1VVyimprsAaM2W1E4rpwxg0okTqCjY8DqefT2UPwIwp5dCfDp
	APrhl/SqrOWUOjKfZZrLSLM6eAG+4UPFc0NPQGtFyuuhLw==
X-Google-Smtp-Source: AGHT+IEmHSyNTp08fMXr4A5rB67VMNaSZtn4ERs0oDz8g1ZrAvCB5h8bXBsdVitG0xZJ5/8DmShtAg==
X-Received: by 2002:a05:6000:2409:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-3a06724309cmr1919180f8f.16.1745402669954;
        Wed, 23 Apr 2025 03:04:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa493230sm18539025f8f.64.2025.04.23.03.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:04:29 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:04:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] driver core: auxiliary bus: Fix IS_ERR() vs NULL
 mixup in __devm_auxiliary_device_create()
Message-ID: <aAi7Kg3aTguFD0fU@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was originally going to use error pointers but we decided it
should return NULL instead.  The error pointer code in
__devm_auxiliary_device_create() was left over from the first version.
Update it to use NULL.  No callers have been merged yet, so that makes
this change simple and self contained.

Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Originally I just updated the check for auxiliary_device_create()
    failure and returned ERR_PTR(-ENOMEM) but obviously the
    auxiliary_device_create() and devm_auxiliary_device_create()
    functions should return the same thing, NULL.

 drivers/base/auxiliary.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index 810b6105a75d..dba7c8e13a53 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -491,13 +491,13 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
 	int ret;
 
 	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
-	if (IS_ERR(auxdev))
-		return auxdev;
+	if (!auxdev)
+		return NULL;
 
 	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
 				       auxdev);
 	if (ret)
-		return ERR_PTR(ret);
+		return NULL;
 
 	return auxdev;
 }
-- 
2.47.2


