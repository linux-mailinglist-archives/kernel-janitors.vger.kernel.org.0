Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3B6AFE84
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 16:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfIKORo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 10:17:44 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52473 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfIKORo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 10:17:44 -0400
Received: from [192.168.178.51] ([109.104.36.78]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MD9Kj-1hz0sQ1dR3-0099ZC; Wed, 11 Sep 2019 16:17:27 +0200
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dominic Braun <inf.braun@fau.de>,
        =?UTF-8?Q?Tobias_B=c3=bcttner?= <tobias.buettner@fau.de>,
        linux-rpi-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
References: <20190911135112.GA5569@SARKAR>
Reply-To: Stefan Wahren <wahrenst@gmx.net>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
Date:   Wed, 11 Sep 2019 16:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911135112.GA5569@SARKAR>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:uA7A4z8RtLe6psHsb2WmUkXx0EoIQhDKSOGnfwLT+4O0T9y7af7
 0YhigydzRBiLVJDONmGQmX1yst8TkCsS5Mp+aIWcwJfTEpepijrLHxd6a5hFdyCDjryOp3T
 4PMjI2bqqQMKR3ycFPeEuDCcUSqiP8X9nTQEA9TbhYIvAWBP3S3BDnEpE34t3r8elKw4EUc
 127dIrcGjezBVfjhKBE0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p11JRo+/rtk=:rEO3bRuBaLFffRL8wjw00m
 yLVfeYZo63B1t922DK95c4A0uiEct4luY+yJlOO+D+I09KYXFJtHYj+tE8d9JczmnQZk4EWp+
 EmezaBfWQ8t9pY3phAZZkRzqqCurIk76eXi2o3nQrreF5C8x64lCRgn9YJ1a1aCwhVGrIg1Cv
 JOmqJiOwFfyLVkobQvH4uJlkj1gdkuPrr+OUbyjFy3uDQgsD1QN/9avS0GaaDvdagwkSy0+tZ
 oXRIJ5ngm++sjN2msSO85LiqE6ndF9T0HmEjk28R0r2zfpM50xV2ey+bcSRoBUcRUENmp0DOS
 cEABVj9BT1coHvPa4TCLuFM9sA8WkVv0gg4SYA2G8LYOab1BL2BlhBsL3fi4PCipjO/ggc6Tq
 xVZ8odd73hejsmjZ8pA142IUQSeLhPd4YcW72aUjtkdB6NU6t/iGsmjwOAICunv0W9LZlDSde
 HzOi02QPS50ODngvULTV56UFru4PG2Ld8qP3vp1TNpuOxgL9DjiGMMTOXoHJsU08hO7HCI3Yh
 Yvni0nFZRu+OgSsn5WhsifVJ+qodk58DXWvdpd1cZ//s92oGrKznXQAjtLDmpXDZXVJboCMUS
 5PWffZUVJTS2YD6FWA/1w3u2jVaP9GfLgJ4AxcXHBk45Asv3gGtJoZNcrrNREsf5TxzmplZCA
 ZInGWZwytBWy3Ti/+jXAlgiOQlP+56ZDDpqPB50Tyc4cDMJZ1vdZVOQ86Os0x6gW8WyAMGQPx
 RCNA3jS6RBUjPmfkYWw/WxcdA5VxeORM71bYilHTEmLhtNSjNODwjap/U9KrwxmWxRSk5Aiq1
 t070jxnOEwT4/Spr5XhK4Bz5MuQjmtipKCJzzI8D3QjtMgCwaO7N0ht+aVuHyEpILcPmU9MWy
 vuI65Ncg2CXzIb52h5cr80xKjBypzeIZZr+xEsTs4=
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Rohit,

On 11.09.19 15:51, Rohit Sarkar wrote:
> When the number of bytes to be printed exceeds the limit snprintf
> returns the number of bytes that would have been printed (if there was
> no truncation). This might cause issues, hence use scnprintf which
> returns the actual number of bytes printed to buffer always
>
> Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
thanks for your patch. Did you test your change on the Raspberry Pi?
