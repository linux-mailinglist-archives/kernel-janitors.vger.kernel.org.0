Return-Path: <kernel-janitors+bounces-409-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68D7F55F1
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Nov 2023 02:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4A21C20C6C
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Nov 2023 01:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B09C1C05;
	Thu, 23 Nov 2023 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id A4B0411F;
	Wed, 22 Nov 2023 17:35:02 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 93A156027E065;
	Thu, 23 Nov 2023 09:34:58 +0800 (CST)
Message-ID: <79634dda-fd3b-5a93-9435-d0a1474b847f@nfschina.com>
Date: Thu, 23 Nov 2023 09:34:57 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an
 undefined bitwise shift behavior
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "trix@redhat.com" <trix@redhat.com>,
 "lizetao1@huawei.com" <lizetao1@huawei.com>,
 "linville@tuxdriver.com" <linville@tuxdriver.com>,
 "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <99ec66d717b249e781f9316cbd689521@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/11/23 08:41, Ping-Ke Shih wrote:
>
>> -----Original Message-----
>> From: Dan Carpenter <dan.carpenter@linaro.org>
>> Sent: Wednesday, November 22, 2023 9:02 PM
>> To: Su Hui <suhui@nfschina.com>
>> Cc: Ping-Ke Shih <pkshih@realtek.com>; kvalo@kernel.org; nathan@kernel.org; ndesaulniers@google.com;
>> trix@redhat.com; lizetao1@huawei.com; linville@tuxdriver.com; Larry.Finger@lwfinger.net;
>> linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; llvm@lists.linux.dev;
>> kernel-janitors@vger.kernel.org
>> Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
>>
>> Perhaps, a better way to silence the warning is to just change
>> _rtl8821ae_phy_calculate_bit_shift() to not return 32 bits?  Do we
>> really ever pass bitmask 0?  No idea...
>>
> I think the bitmask should not 0, so just replace _rtl8821ae_phy_calculate_bit_shift()
> by __ffs(bitmask). To be safer, callers can check bitmask is not 0 before calling.
Thanks for your great suggestion!
I will send v2 soon.

Su Hui


