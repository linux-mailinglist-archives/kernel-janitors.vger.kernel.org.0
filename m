Return-Path: <kernel-janitors+bounces-481-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD987FBB06
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 14:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A67282C3D
	for <lists+kernel-janitors@lfdr.de>; Tue, 28 Nov 2023 13:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15AC56B7B;
	Tue, 28 Nov 2023 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDspK1lQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561BCD51
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 05:13:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so3801178f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 05:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701177203; x=1701782003; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4lKo9bLDim6aDctAZZS9tg9Ds7n6sj9Q/UD4Yw1TdY=;
        b=KDspK1lQGnrqXT7YQDub+p8H/owMmhXYQEyfz79Xikk6rbcvJWhbeltXH+tKdkSnWn
         HP2igLRfNEZds7Zc+SI/I4o0nudIf5+5Dwgdg4Z01eGNCJ7IZF4dPw9XRfWgRdCJAPw5
         uK+uOSNgMyzZYit2Mg5rydT/cihk+lwj9Xble6UAtIv7AD3W934KIh29GJhb7sFb3FAB
         LqNnHYxwpdy9TLVDk4K6Ma2VbVfdn+kJsNOvXu6gHsHL4+wI7H4BfQprG1gZN3gToXx6
         um6eSzAkz0PHVhW8qGAq9pfhUz3WgpJq6lotMToCTNhnZzEoo/r0MVE3oTSqoMC92PYD
         t2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177203; x=1701782003;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4lKo9bLDim6aDctAZZS9tg9Ds7n6sj9Q/UD4Yw1TdY=;
        b=Aq/h13ZGotiui/nNRP6fjPDN7/asrSkam8Yg8vaiNWC3fFNvKzpi9fhgmmA2qLwkdQ
         /fsM9ftgeEoYEENjPW5NYk+igaHcRlpMxd+oGTY+isov9uX/jXkDt3pm7zgS7Ns/iCpS
         COYaF0N7dUNaFpIjVcSg8m0OpHgveBWnPy2GIQ+BwcMNeWX3r01QRlDHCpOMH1FqhfwM
         74xCIX7ihN8T5cjvsLyMuw9aPtpuyBHwsC2XOnPKGg58vhi/uV8EE/cjC16E++/cctVb
         4QEIk4ZwpbrxzRYZJLBcQtIVd6jUD2kxydj4hVK4EobFYJEj3X9MBWZ/QMeIFgI9zbsF
         a20g==
X-Gm-Message-State: AOJu0YzkB1pw3Ad0pTetE/qsU/GBV7rKu6pEeZ5epMx5VC/WB/081+u8
	TTqW6GY2BueVos/SzVvEE4a8gw==
X-Google-Smtp-Source: AGHT+IG6ZnjMO1TgB7xr2eWRdAiProUe18u2mVdxwlRZXNoDvaF6Btqju7QeacT/L+RNroDhmltb2Q==
X-Received: by 2002:a5d:458b:0:b0:333:73c:7850 with SMTP id p11-20020a5d458b000000b00333073c7850mr3441608wrq.34.1701177202769;
        Tue, 28 Nov 2023 05:13:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h15-20020adff18f000000b00332ea526059sm12038283wro.82.2023.11.28.05.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 05:13:22 -0800 (PST)
Date: Tue, 28 Nov 2023 16:13:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shinas Rasheed <srasheed@marvell.com>
Cc: Veerasenareddy Burru <vburru@marvell.com>,
	Sathesh Edara <sedara@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] octeon_ep: Fix error code in probe()
Message-ID: <cd2c5d69-b515-4933-9443-0a8f1b7fc599@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code if octep_ctrl_net_get_mtu() fails.  Currently the code
returns success.

Fixes: 0a5f8534e398 ("octeon_ep: get max rx packet length from firmware")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/octeon_ep/octep_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
index 423eec5ff3ad..f2e5c7d80398 100644
--- a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
+++ b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
@@ -1383,6 +1383,7 @@ static int octep_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (max_rx_pktlen < 0) {
 		dev_err(&octep_dev->pdev->dev,
 			"Failed to get max receive packet size; err = %d\n", max_rx_pktlen);
+		err = max_rx_pktlen;
 		goto register_dev_err;
 	}
 	netdev->min_mtu = OCTEP_MIN_MTU;
-- 
2.42.0


