Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C383E7350B3
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Jun 2023 11:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjFSJpe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 19 Jun 2023 05:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjFSJpb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 05:45:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0BD137
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:45:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso4204409e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167922; x=1689759922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lOpQQ0uvTWgPqy3NfFpsxoyopGZCSNNgUhalRviPMo=;
        b=Kk+QBVI7yTg74fnBrF7IkaShnYdyhhgUWKaQuSqM02qfCIfPGmcKgTm3BPWYTvPkZx
         pTfT2WbuSrVHbOymL2SAdviQSj5ESxfCVBBiEYwpjMQ2ysE148PohBLIi1zkIx6xCsbm
         NTCYivjNTEyd3BI+HgBLv0HuHXqEFyEhsgfhfnDNvkhsZ29Hxp3K6KxSQanCoxG1tcc5
         jv45Mno/+m5QKxa2wJHJSpAba+NKB60PQjJ2MtBWmLXS3moACvI/WQwl5mt9DsAYCPTo
         gHALTsAGPFtD5iKvLW+WUIdEQp01iGtPX06qJcbidyYZyUiCLo+XfOFC9JbEVshgR4pZ
         JsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167922; x=1689759922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lOpQQ0uvTWgPqy3NfFpsxoyopGZCSNNgUhalRviPMo=;
        b=EEZv/SgPJYucjX3F0lp7YM1tui52zEPZEEf3lPHHU847HVM8Vf877SQro/v1upKJpe
         ItjM++1rhlzxNP/UrNh8kmoBafibKKzzmcIQK+/CSlMi0H/LOg3JNGV2fQFOJ9FaMzkv
         GG+yj663sw5JA/x7UcbpfZGZ9uXldjS75R97OHX54Y6EpGm5xifLzLJ1/bsN8l8/qPct
         x1WNbSfZk0M9ufmYAbAWGgEQeiufqd4ggnjW7c53NHotqifu4Ssb+f/SW9J7lohVFrPD
         0mhFk4PNwC8J0l42pt5jD7xIva/CZVkw+NRMGCQvIUaJaa6Pz6WJDb2o0IAOwKEB6QNh
         oDBg==
X-Gm-Message-State: AC+VfDwb9eEhPw09LAPGGxMI/kxgC/iYr2r3M1fd4EYglTXKu9dCB7UM
        tcvglJgLhO/KEJrsPdVUmR1gAQ==
X-Google-Smtp-Source: ACHHUZ5jSXfwChpHxsmYJaI2b4+nyll3e5wFqnVJMUlgcrfp2CP0jhwUV9PhBQ5RcAiCfixTsO9H0w==
X-Received: by 2002:ac2:5b05:0:b0:4f8:424a:6804 with SMTP id v5-20020ac25b05000000b004f8424a6804mr5541064lfn.28.1687167922197;
        Mon, 19 Jun 2023 02:45:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o25-20020a1c7519000000b003f427687ba7sm10170599wmc.41.2023.06.19.02.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:45:20 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:45:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Elen Song <elen.song@atmel.com>
Cc:     Richard Genoud <richard.genoud@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] serial: atmel: don't enable IRQs prematurely
Message-ID: <cb7c39a9-c004-4673-92e1-be4e34b85368@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The atmel_complete_tx_dma() function disables IRQs at the start
of the function by calling spin_lock_irqsave(&port->lock, flags);
There is no need to disable them a second time using the
spin_lock_irq() function and, in fact, doing so is a bug because
it will enable IRQs prematurely when we call spin_unlock_irq().

Just use spin_lock/unlock() instead without disabling or enabling
IRQs.

Fixes: 08f738be88bb ("serial: at91: add tx dma support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tty/serial/atmel_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 6e9192f122aa..3467a875641a 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -868,11 +868,11 @@ static void atmel_complete_tx_dma(void *arg)
 		dmaengine_terminate_all(chan);
 	uart_xmit_advance(port, atmel_port->tx_len);
 
-	spin_lock_irq(&atmel_port->lock_tx);
+	spin_lock(&atmel_port->lock_tx);
 	async_tx_ack(atmel_port->desc_tx);
 	atmel_port->cookie_tx = -EINVAL;
 	atmel_port->desc_tx = NULL;
-	spin_unlock_irq(&atmel_port->lock_tx);
+	spin_unlock(&atmel_port->lock_tx);
 
 	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
-- 
2.39.2

