Return-Path: <kernel-janitors+bounces-6432-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB99C6A0C
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Nov 2024 08:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5642820A9
	for <lists+kernel-janitors@lfdr.de>; Wed, 13 Nov 2024 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA60E189BA9;
	Wed, 13 Nov 2024 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TfdJDVka"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D018756A
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483094; cv=none; b=plrjsF8yFwZoRDGoN16DUfpEW/RDqp0OJJBZwCji0MsBmCtYT8h6n96yUbkVQvn8Xcbcolhc59agF0KBvwj8cUyBXGquZLwpcAjq1jxSCZI7UV+TNs7tX+9GX2ZmIevrc3mLvsitmqT4E2oi3kTaVleUWSVLWy+6c9o4vKXrX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483094; c=relaxed/simple;
	bh=tmuSu2iaBDMllSjqEsXXqjaCbaHp1pOOtGHzUZ12VGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3DKVLqGMQntP9LYQiaWEYDu99RQogj67N0PISt4zuqra3h8OnJOoNs7dyp5whOInhhAuK4fAni0rYJBqWUCO+s/Vdn3HI9MINm0qhDa2PLpTdYd30kW5isDD8dFqmRrzKOEHiMK0DBFpZB7IIANPsJGZ/A2kXWp5QpomR9rRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TfdJDVka; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so57092685e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 23:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731483089; x=1732087889; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4csWLl7Ej9wAFH627/RtOwQI0dYK7exWefQ0DxYMq0=;
        b=TfdJDVkaOxLfhRptRKlUOMDVESNlELFaftJuuk5UCW5/H0i2au18apKckCipmXbvql
         r3ZDtsKxL+s7Oz+8GkEFkCIBdAPBVPQHyGI14c/tr3LytgcGxVhTVObH8FspCR5ngFex
         3dKF+ian+DEDqAjiicGlScqO3AL/nCBENkHAraxr/gmdZEWJqHOuSe3Taa2PKoJaGGah
         cim3o89u+lxXlafzGjn71ECMcLxv7TCynXv+UXj9OkC7pbo6zqJ8QAu2qjXzYBxTyB3J
         hDs/gZzWdqSRy0WEbi2zhm4WGplKpLNscjrnfVLynT1p1qzuphOkawLMGloWgHuDviZs
         Zv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731483089; x=1732087889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4csWLl7Ej9wAFH627/RtOwQI0dYK7exWefQ0DxYMq0=;
        b=LYYHwhcF3djz55Ay7Ksiuj8izsPot9sn0v2VpVuG99LJCEHOgtVeNJSQToo0MgbPLo
         2XJx+/Q5lHcbaGvhZBz4kG3F6cp74tZSVBPPDkSDy8aH+ndfckRXg3pv60hjMiV5u4F3
         uo55uFhrF+oonuv8v1QkybTczpHVe372kliRwQfp7tyFzPjXc/7KxNg4hFVkPnl/ThRW
         M+CUuoYvK5xYfMyiw7is7gVqi/Aq0RTAmAsBb92B9K5Dz9peibLBVZSUcKFHwaN/C3aT
         XzMkURf5DlOfBx8Isd52rdrFMuRZ99RRIq1EgaM2dNP1UaAbO6Jf2K2WkjSPy4uCoKEX
         X8uA==
X-Forwarded-Encrypted: i=1; AJvYcCXFvM5OSwTtpSU6nhW5HEZY9OHUqrF4Wv9qKz52iZ+mOXLEYTdW5xAD8tCDO6SE9b5bQWaQsA5mha+YFBoS3gU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pHiLV3LGrAVEEQAYNcd+Ale3kv2D1Y0Z/DjM8Q1CGaP+3cSq
	elyl6tfH1wfetmqLAOkQsZNh01JAIQT4Z0rxwIv0TbsBoygvlpgHf58XFtqymiw=
X-Google-Smtp-Source: AGHT+IFXhHLRS1YpnITs+WT4llH7CTWUIO/WdLiyAZE4altKKyOTrJjPAyh4aJtRTdM5ubYGkxnsCw==
X-Received: by 2002:a05:600c:a4c:b0:431:5df7:b310 with SMTP id 5b1f17b1804b1-432b74ff9b1mr168355735e9.8.1731483089349;
        Tue, 12 Nov 2024 23:31:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe6csm17353305f8f.31.2024.11.12.23.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 23:31:28 -0800 (PST)
Date: Wed, 13 Nov 2024 10:31:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: enetc: clean up before returning in probe()
Message-ID: <93888efa-c838-4682-a7e5-e6bf318e844e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added this error  path.  We need to call enetc_pci_remove()
before returning.  It cleans up the resources from enetc_pci_probe().

Fixes: 99100d0d9922 ("net: enetc: add preliminary support for i.MX95 ENETC PF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/freescale/enetc/enetc_vf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index d18c11e406fc..a5f8ce576b6e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -174,9 +174,11 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
 	err = enetc_get_driver_data(si);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				     "Could not get VF driver data\n");
+	if (err) {
+		dev_err_probe(&pdev->dev, err,
+			      "Could not get VF driver data\n");
+		goto err_alloc_netdev;
+	}
 
 	enetc_get_si_caps(si);
 
-- 
2.45.2


