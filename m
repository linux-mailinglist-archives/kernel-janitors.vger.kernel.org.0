Return-Path: <kernel-janitors+bounces-244-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C287E96C9
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 07:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F7F1C2093F
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 06:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60A911700;
	Mon, 13 Nov 2023 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B92C8DE
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 06:53:34 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5302910E7;
	Sun, 12 Nov 2023 22:53:31 -0800 (PST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id C7212604FCB12;
	Mon, 13 Nov 2023 14:53:28 +0800 (CST)
Message-ID: <065d6090-38fc-0cc0-db47-f9ba5b1c5d7d@nfschina.com>
Date: Mon, 13 Nov 2023 14:53:28 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next] wlcore: debugfs: add an error code check in
 beacon_filtering_write
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <87h6lquqiv.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/11/13 14:16, Kalle Valo wrote:

> Su Hui <suhui@nfschina.com> writes:
>
>> wl1271_acx_beacon_filter_opt() return error code if failed, add a check
>> for this is better and safer.
>>
>> Signed-off-by: Su Hui <suhui@nfschina.com>
> How did you test this?
>
Hi，

Only compile test.
Clang static checker complains about this code that  value stored to 
'ret' is never read.
And most of the caller check  the error code of 
wl1271_acx_beacon_filter_opt().

Such like this:
--
drivers/net/wireless/ti/wlcore/init.c:277:      ret = 
wl1271_acx_beacon_filter_opt(wl, wlvif, false);
drivers/net/wireless/ti/wlcore/init.c-278-      if (ret < 0)
drivers/net/wireless/ti/wlcore/init.c-279-              return ret;
--
drivers/net/wireless/ti/wlcore/init.c:410:      ret = 
wl1271_acx_beacon_filter_opt(wl, wlvif, false);
drivers/net/wireless/ti/wlcore/init.c-411-      if (ret < 0)
drivers/net/wireless/ti/wlcore/init.c-412-              return ret;
--
drivers/net/wireless/ti/wlcore/main.c:1652:     ret = 
wl1271_acx_beacon_filter_opt(wl, wlvif, true);
drivers/net/wireless/ti/wlcore/main.c-1653-     if (ret < 0)
drivers/net/wireless/ti/wlcore/main.c-1654-             goto out;

Sorry for the few test.

Su Hui

