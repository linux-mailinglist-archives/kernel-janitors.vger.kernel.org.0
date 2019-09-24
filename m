Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B217DBCA28
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Sep 2019 16:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441247AbfIXOZd (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Sep 2019 10:25:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55072 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390391AbfIXOZc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Sep 2019 10:25:32 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <connor.kuehl@canonical.com>)
        id 1iClkw-0001nq-S0
        for kernel-janitors@vger.kernel.org; Tue, 24 Sep 2019 14:25:31 +0000
Received: by mail-pf1-f200.google.com with SMTP id f2so1601968pfk.13
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Sep 2019 07:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2M7WLJ3K74mxo9MIAH0NR1Us3L8/cH8DqjuitiaoO0=;
        b=KawYgHBWdN/PzQQHZJdyfZjp7QDSbWGxswqM+BuNA7belqkxk2Fjovs3CGgV1z5fQv
         F39Mj1caCERJX1Hj8HD/LjaEjufFMeyMpqEEiW82dpm21bgQuF5+dwE5DpJapFPCsDib
         bDy1oABtDqtYG3ab46DmuinBRbFK2l8c46JKyiN5nKbQus7grGEVvKwHSbW91vGmr/c4
         itszPE/M40s4MEkeBnLCf//M/XCdh0wUSfIUIGnOUpotJeUl+MpFHfNfTq+vwN6Ch+Vb
         /jKJRQE1OFoSjBjH4z+YbeQpdIxHxT9lbIsNVS7OBRN1UdzSrj011aHq662UZjqCs31f
         7xpw==
X-Gm-Message-State: APjAAAUw4OIg2I2347EtQu0cZf6TUvf4LWzyfmoZDYzjN2uqrOb+lElC
        eCkWSDIuGS+Vo2++cPKPaXCzoajlO25kDXp65OCg25PbknOKYuQUTjRNEMk24SiLGK++aQ9InrZ
        O9hN4egOTBVm9niY7pwWDp7H9tOCTN8PARMzSq7AIuq1HKA==
X-Received: by 2002:a63:a051:: with SMTP id u17mr3356951pgn.7.1569335129530;
        Tue, 24 Sep 2019 07:25:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBnSY55GzZ2RMXUXmrcReDI1y3kPMa6mqQgjlGQHKADDop+hVWXf6WJYYfPT50sFT/Uq43rQ==
X-Received: by 2002:a63:a051:: with SMTP id u17mr3356931pgn.7.1569335129308;
        Tue, 24 Sep 2019 07:25:29 -0700 (PDT)
Received: from [192.168.0.179] (c-71-63-131-226.hsd1.or.comcast.net. [71.63.131.226])
        by smtp.gmail.com with ESMTPSA id f188sm2037899pfa.170.2019.09.24.07.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 07:25:28 -0700 (PDT)
Subject: NACK: [PATCH] staging: rtl8188eu: remove dead code in do-while
 conditional step
From:   Connor Kuehl <connor.kuehl@canonical.com>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190923194806.25347-1-connor.kuehl@canonical.com>
Message-ID: <52e473f0-6b92-9504-b86e-a73a0d82617f@canonical.com>
Date:   Tue, 24 Sep 2019 07:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923194806.25347-1-connor.kuehl@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I'm sending a V2 with the loop removed.

Thanks,

Connor
