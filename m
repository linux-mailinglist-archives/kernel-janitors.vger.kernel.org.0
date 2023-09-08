Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E47B79832F
	for <lists+kernel-janitors@lfdr.de>; Fri,  8 Sep 2023 09:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbjIHHTH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 8 Sep 2023 03:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjIHHTG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Sep 2023 03:19:06 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780B51BF5
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Sep 2023 00:18:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so19834215e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Sep 2023 00:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694157534; x=1694762334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jUsdI8IAMPdJ2/ajS6yTZqWDFGbQHyhhBt8Pkr2WW8=;
        b=NeAR2uxEmJ7UFdnUqFQbiNrJh6+Yzvc4JMjc8ASsiaixzKWJOgTj0wvFaIfGcRSoGT
         7LlBdT0SllqJRKtkZeVugBnran4E4ChfylGrDEDmzj2kWMzcCJphb3mixG/K74CFZ+JV
         md737IVhoiq+Vtcz7T+xIdpCOu6gEzClQRoAqcGZ9vN/EVQHgM6hyxzKlVH46TvH48U9
         uJSmA16QdkNXrelL4PJU2DKBRwaluLVkPBQahBU7xw7LznaexbT0Nctr+nIPOvNGcLxe
         yEKIjrRoLoEeeQS09I0lqA12qREhZLtkpPDvsT5GPadX6fCH9/LZpaY/qdwhAQGuR4ai
         WFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694157534; x=1694762334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jUsdI8IAMPdJ2/ajS6yTZqWDFGbQHyhhBt8Pkr2WW8=;
        b=Uudj/hfWP0nMJ/MnorWU5K4FSj4FDO5LDmBQLoAoxAUIMRunyWQzkdqodCS0Vg3dRQ
         Zqr9ovCqY0++T9+pJcwoeKx10YK3fz/4CQCe/+3VPZBJuIIy/S314jiS0z20Yt235jIr
         LHoYZKECz7qyq11RtyUx8Z77rPl5Y57xRkCBQj3WdOLkvjbkVjMLPPUFf0VXo2mWwsfN
         8yYB+yK5TCQvbuK/1qZ4mRl/bqiwyZlr3RkfqItPAGU8QI275Cn/2BzKLXuxwVRUVrK8
         XiIqsl/PSLGMyYbA/fzjqbU/t9E4ud1oMmBZrgg3P8NwjN2JzR+0ITkMuk2Nn6PO8okR
         u2DQ==
X-Gm-Message-State: AOJu0YxK5zDE99h18c3Lp6jH1n2Ii8cPighIYALpOTwCZTbrQ16Jfhoi
        soLfFgxxP8ghsSnlaCv3Pk9wh+81HW9oEI41p/8=
X-Google-Smtp-Source: AGHT+IHQsY/0Ej3aK9aAUnwQ/E6w27NF8Re4ys97xwbLX+YFgUeolkfZLNQJw3R/v4XFVKS7HptjDg==
X-Received: by 2002:a05:600c:3b1e:b0:402:f536:41c5 with SMTP id m30-20020a05600c3b1e00b00402f53641c5mr1277095wms.3.1694157533662;
        Fri, 08 Sep 2023 00:18:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003fee7b67f67sm1182993wmi.31.2023.09.08.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 00:18:53 -0700 (PDT)
Date:   Fri, 8 Sep 2023 10:18:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <5a6da4c1-6d65-4219-8314-9b5697bcf8e8@kadam.mountain>
References: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
 <053077e761ecaeb44b76f5865e100d588101461b.camel@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <053077e761ecaeb44b76f5865e100d588101461b.camel@mailo.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2023 at 09:53:36PM +0530, Deepak R Varma wrote:
> On Thu, 2023-09-07 at 12:54 +0300, Dan Carpenter wrote:
> > This accidentally returns the wrong variable.  It should be "qphy-
> > >vreg"
> > instead of "qphy->phy".
> 
> Hi Dan,
> Just curious: How did you find this? Visual catch or Static Analyzer?
> 

This was from a Smatch warning.

$ ~/smatch/smatch_scripts/kchecker drivers/phy/qualcomm/phy-qcom-m31.c
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/phy/qualcomm/phy-qcom-m31.o
  CHECK   drivers/phy/qualcomm/phy-qcom-m31.c
drivers/phy/qualcomm/phy-qcom-m31.c:175 m31usb_phy_init() warn: variable dereferenced before check 'qphy->vreg' (see line 167)
drivers/phy/qualcomm/phy-qcom-m31.c:259 m31usb_phy_probe() warn: passing a valid pointer to 'PTR_ERR'
$

regards,
dan carpenter

