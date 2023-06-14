Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA48872F51C
	for <lists+kernel-janitors@lfdr.de>; Wed, 14 Jun 2023 08:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241535AbjFNGpp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 14 Jun 2023 02:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjFNGpn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Jun 2023 02:45:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CC6E41
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 23:45:42 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-30e4eec95c8so5910651f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686725140; x=1689317140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lfDvPUG1HGmVrnIjGIO4jjRv0+fBzXaClOHkCNskUs=;
        b=LCgI1DfnigANtGLRfWnBEpO2Lr4T328f8G202AHZmy8wbM+vZGL7gwrD78SsfhjWgY
         PErdRquiUaEkd7ZbsZVEKysxPqik6ZHwB9hAQEuF8EgPAWlQpVfzQTe4KTxGAnv4eDEP
         XOGLzIqfNvLEsuCXkC9sDhdQkoqLUA3fczTUEYUDGBsLggcRG5SJYSR0eQlwE4xpoEJ2
         OMQ7AmeN4ze0lIt4NSI/uyRTcJzSDka2hcIthWJ8YdQN1mRmolYDNx8IHJMtH0Srz2pa
         wxRY3mxLzlV30h1OkY9mddW1oVQkiRzmPgfl/nSlDo3Sat1l0wcIOaRXbqi8RNOD/zjR
         1Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686725140; x=1689317140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lfDvPUG1HGmVrnIjGIO4jjRv0+fBzXaClOHkCNskUs=;
        b=UqJ9Q2iJ+P7d01b1cZN9KVupCF5SR0NYZBtcm6jIwn5WOkEoNNLNViXl+FCwHBrGuA
         bZZD5N5NfKRTMCqagP2XO/IByutKwD1Gmlc72MzyM/dKDBMO+ClXsGqyCCHKR0nGU1DY
         A8V8RL1geWVK12YaJHgVW2bB9eurF6XI1VE0QTSc3R+ZgoJ+ZouwFzo7RYwP2aaPjyRJ
         XnJhjZL5zMnQ+QDy7AzaLQeHnL3IbQy3YBoRFZTvy05Ujx/sV/jSzEeiPGzuzXRHxbeg
         rVy8c1KxXS61ZQKiox8p3wNniziHkwW9C2N9g88t1KXbVZ6KcvU2EnviDBQjPpG+uooV
         cVJA==
X-Gm-Message-State: AC+VfDx/blXQw5hzpeVsTPwo7bEtLSaGa7lFXr5zQJBuScz61TmtxGKl
        ghdn//7EsV7l21gQy4n9J9gdJeuM0eIYDKYAoFc=
X-Google-Smtp-Source: ACHHUZ4qHR3JqF2bnGdLqUXi9q675N2orXuLyu6Exs7MBCEJIgNs3IpVU3S3lsQHQKlsDAr3O4YXDA==
X-Received: by 2002:a5d:4c4f:0:b0:306:2e62:8d2e with SMTP id n15-20020a5d4c4f000000b003062e628d2emr9645446wrt.1.1686725140565;
        Tue, 13 Jun 2023 23:45:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020a056000054e00b0030c2e3c7fb3sm17060054wrf.101.2023.06.13.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 23:45:38 -0700 (PDT)
Date:   Wed, 14 Jun 2023 09:45:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 led] leds: trigger: netdev: uninitialized variable in
 netdev_trig_activate()
Message-ID: <40653e66-4cca-4c6f-9d0f-e70b3824389e@kadam.mountain>
References: <6fbb3819-a348-4cc3-a1d0-951ca1c380d6@moroto.mountain>
 <83344fe7-6d95-44d8-8ce7-13409c7a8d87@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83344fe7-6d95-44d8-8ce7-13409c7a8d87@lunn.ch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2023 at 02:51:59AM +0200, Andrew Lunn wrote:
> I think his actually needs to be merged via netdev.  e0256648c831
> ("net: dsa: qca8k: implement hw_control ops") is in net-next/main.  I
> don't see it in leds/master, leds/for-leds-next. Also, git blame shows
> mode was added by 0316cc5629d1 ("leds: trigger: netdev: init mode if
> hw control already active") which also appears only to be in
> net-next/main.
> 
> A lot of these LED patches were merged via netdev because they are
> cross subsystem.

Ok.  Thanks, Andrew.

In that case, let me resend.  I just used get_maintainer.pl and it
didn't add the necessary CC list.  Plus the netdev scripts won't run if
you don't have the correct subject...

regards,
dan carpenter

