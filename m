Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08C849EEE3
	for <lists+kernel-janitors@lfdr.de>; Fri, 28 Jan 2022 00:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241407AbiA0Xfz (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 27 Jan 2022 18:35:55 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37373 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241508AbiA0Xfy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jan 2022 18:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1643326555; x=1674862555;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=joVDz8/kDfcvQwj7YtINoD9H51dhQI5sBaq3HaVkb6M=;
  b=ElVE3Qt8ftPo8s0AZRV2cgGXtTqCkbXk+STBgvMy6BeZtEd9b5doHziK
   FaXakV15R+xHev2xCUt/Lp9Sfj/IHr8icpPuMgoOJXPhOiKc0Dva16bPd
   hpNjbjYOpTMGrWiLlMtoGLQrcOT+ObkNlXRSF6Lxy6FhuNrUA3HB8fGY0
   6S2WrXE6jwhDZxIq2nnIYcBrVjBEGrgmuHlDIog2J98Y/73t7mL7ANAKO
   bd+XYp+93efMI0nMtuWHvUo2Wjuyj6SRuPHf3dLU/DKKNp1buZlHkI6wA
   lkeVvgVpIerxugQ7FCMTss5qF5nmP109m0b7S2/QsnD9AOsleVfBzpVnD
   A==;
X-IronPort-AV: E=Sophos;i="5.88,321,1635177600"; 
   d="scan'208";a="192572182"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2022 07:35:54 +0800
IronPort-SDR: H9BIK8M0caMXfqEQmDMlgUTbL0zFO/P67aVAuMRjfYjm28lqUVfnMhDAjRdtFHCKK+c4A1sSzz
 shkwIQRwjomEIctzmNlKEq5Cn0hZgD/KkPZpDzOOX7JRIRSiHr4akjyvLpPKqPMO98qunsJlLh
 FUXlEAU5YArBDo9vF48lSF0SnaCzfPeI4SkffGD1qomgVxM2r9bJejjWlUZ1IQw9pDnX/jOfC7
 oumz8aYb2D9+TB6UyUySNflaMkALBvp06XLlapmFu0i84w6bMM88B8o3iRR11T5Z630aMFliFe
 NInv/cX8R17U8AwmD5YdGYkT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 15:07:57 -0800
IronPort-SDR: PRtUvYjaqBW/QDgnQ5cAak8nqveqQ+S//zs4bmm9UAtfcRn3aoec6ts5FghQB8/Ve/bC8Opq8y
 pZ4d3OBqPbbm9173KPghCo0+D5iAqsh4UhVEpivW74+iAETD5EKerVNCDgTNX+sL0F70fWCroV
 XBUgttUm5qAZdj8/kjEyeZruKdzPtYeWx69CtRuybEWDVwmhVGWTj5Tot+nJXECoQn9kgR2cQP
 XXaVn8zXQuyTF8yByHDg6YhYT/grtur0+wJ/fVXqR9PgUftBNc/5K0l1IAUk2o6xWGkLdVkoBu
 0gs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 15:35:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JlH5h6yS6z1SVny
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jan 2022 15:35:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1643326552; x=1645918553; bh=joVDz8/kDfcvQwj7YtINoD9H51dhQI5sBaq
        3HaVkb6M=; b=Yph6A1fRi5O0ZWTcnNxQkbGTrZSJ1BLFs09kmR4Ox9OCrn2OXIp
        Z7ehxOdOtTGkxPGFu48xw04XpmNBkJ8bUnaBnxAPOTbGG38ldLREjcUUbZUIsGM+
        lZyFQB9DsxF++Dhyn0KIBrH8q3A7kpP2Hnr73nr1ssgah5FYH2oWif0SpWMZuESq
        ny7gTnXrBLi9w9GjURkUicyVy5ZSA0iBzsBWmwGDILWDp/JMnwIICRV/ZT7+IyKZ
        GREV/XIxUZK2GUVDGg6atEHQO0TTxqFCPhjOtg/iyg9YJa9iJouivuwATWCHlAxh
        JFXvtzIMcejd4BeRgHMzSj/8rn8Gq0CF2Jg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OrFVSkcLK12j for <kernel-janitors@vger.kernel.org>;
        Thu, 27 Jan 2022 15:35:52 -0800 (PST)
Received: from [10.225.163.58] (unknown [10.225.163.58])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JlH5h05sHz1RvlN;
        Thu, 27 Jan 2022 15:35:51 -0800 (PST)
Message-ID: <bf7d86d9-48c9-9d74-60ac-d8600f13393e@opensource.wdc.com>
Date:   Fri, 28 Jan 2022 08:35:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ata: pata_atiixp: make static read-only arrays const
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>, linux-ide@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220123221622.5543-1-colin.i.king@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220123221622.5543-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 1/24/22 07:16, Colin Ian King wrote:
> The static arrays pio_timings and mwdma_timings are read-only so
> it make sense to make them const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to for-5.18. Thanks !



-- 
Damien Le Moal
Western Digital Research
