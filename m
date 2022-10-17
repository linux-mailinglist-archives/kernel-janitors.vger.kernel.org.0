Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B7D60079B
	for <lists+kernel-janitors@lfdr.de>; Mon, 17 Oct 2022 09:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiJQHVu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 17 Oct 2022 03:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiJQHVr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Oct 2022 03:21:47 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2615A2F6
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Oct 2022 00:21:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w18so17069840wro.7
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Oct 2022 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU/ZdfM78da9c7vhuJ3tQMK7PTSFN0tMAy5+CM4O9J0=;
        b=X3ok5Nih/FlReMiWjKy5xqKJxZVKHoVbeWVEWAD3wYfGWlg9uqhDFIrwyuRSPlsA3T
         kP1GS9oKNF4td2IP9830Sp62s3RXtgW02/0ozB5k9CDbpSzpuuttlwQaMP35rZewrZHp
         OVYwXtI3X/Ld09TcTrQ4PVvO9WyeTe7s6FeZcRJW8zVfhSo/unXr6yxLbZfrs1KRQrTO
         BguKz5xJjZIWH18uM3AoSejPmx9yxpfjd207dsLOCsz2sa1FxQEfHU/W80kDHWbYXFju
         pXJoBp3xTFp4cwSthI/Cn8WGunpvlgprE1v1LyW7qF0wAguxNor/weauGneRp+7oOH89
         K6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EU/ZdfM78da9c7vhuJ3tQMK7PTSFN0tMAy5+CM4O9J0=;
        b=RoPKhDb6JbQlm8wIRskrJrBabHrLWtd8UoyvsDoM3FALWptZ7i0vqBsNTz/Bij4cRV
         7YMYTMIOk6g7z+RXn/Xavdo2AD8jO1nVzRZpGdr/N48F2ePeTk72z5V7TcHo3glnbA6l
         nLW36yH1WUHAO8DfFfGhXN9dfDCWORLY6EcQBcv/VdrxdFVoY3M9nJLQv9CWEmD09P33
         AXTfFyQZDW2XN78Sem7yoemnfTet0PanzR8OUjZCbe6LKNukYBARcW/xyzXZp167Hpqj
         a/gqZtehQK420gGoj53DN5oMyuxB7Kq4aG3AfXDye9i2eq0KBfnTtaLRHYR2Un8M7Ztd
         B2cw==
X-Gm-Message-State: ACrzQf3jhmv3TeXdjUh0N9CnrtsC7D+Uuor+tbz5rqAGdPo/wp/jAhWv
        l2vg+dT2Ph9iVgbKQZyl7kSDuA==
X-Google-Smtp-Source: AMsMyM44eHOtB/PGvOIoa6qd+aOg/7cvzQ3jIkw5NcWW2wTWnG3/o7Y4pTN8FsidfKAz6NSU37hYsQ==
X-Received: by 2002:a5d:588c:0:b0:231:893c:1a08 with SMTP id n12-20020a5d588c000000b00231893c1a08mr5511682wrf.317.1665991296791;
        Mon, 17 Oct 2022 00:21:36 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ea6:24ea:3fe7:64b9? ([2a05:6e02:1041:c10:ea6:24ea:3fe7:64b9])
        by smtp.googlemail.com with ESMTPSA id l32-20020a05600c1d2000b003b47b913901sm25842128wms.1.2022.10.17.00.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 00:21:36 -0700 (PDT)
Message-ID: <3b2a56af-8bed-f8c2-3e7a-8051f78b8a5f@linaro.org>
Date:   Mon, 17 Oct 2022 09:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] thermal/sysfs: remove unnecessary check in
 trip_point_hyst_show()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y0pu2M6kKzIlhCMw@kili>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y0pu2M6kKzIlhCMw@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/10/2022 10:27, Dan Carpenter wrote:
> The "ret" variable is zero at this point.  No need to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
