Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0926A432B67
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Oct 2021 03:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhJSBN7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 18 Oct 2021 21:13:59 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:55485 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhJSBN6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 18 Oct 2021 21:13:58 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 19J1BQSc8013000, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 19J1BQSc8013000
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 19 Oct 2021 09:11:26 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 09:11:26 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 21:11:26 -0400
Received: from RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098]) by
 RTEXMBS04.realtek.com.tw ([fe80::cdd5:82a3:e854:7098%5]) with mapi id
 15.01.2106.013; Tue, 19 Oct 2021 09:11:26 +0800
From:   Pkshih <pkshih@realtek.com>
To:     Kalle Valo <kvalo@codeaurora.org>
CC:     Colin King <colin.king@canonical.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] rtw89: Fix potential dereference of the null pointer sta
Thread-Topic: [PATCH][next] rtw89: Fix potential dereference of the null
 pointer sta
Thread-Index: AQHXwduziBNegQ3KtE6tzEeaYjpkJqvX/pCwgACwb0mAANdosA==
Date:   Tue, 19 Oct 2021 01:11:25 +0000
Message-ID: <abc2e3a274694d48aa468491df334349@realtek.com>
References: <20211015154530.34356-1-colin.king@canonical.com>
        <9cc681c217a449519aee524b35e6b6bc@realtek.com>
 <87pms2ttvi.fsf@codeaurora.org>
In-Reply-To: <87pms2ttvi.fsf@codeaurora.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/10/18_=3F=3F_11:09:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/19/2021 00:52:27
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166808 [Oct 18 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pkshih@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/19/2021 00:54:00
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


> -----Original Message-----
> From: kvalo=codeaurora.org@mg.codeaurora.org <kvalo=codeaurora.org@mg.codeaurora.org> On
> Behalf Of Kalle Valo
> Sent: Monday, October 18, 2021 8:12 PM
> To: Pkshih <pkshih@realtek.com>
> Cc: Colin King <colin.king@canonical.com>; David S . Miller <davem@davemloft.net>; Jakub
> Kicinski <kuba@kernel.org>; linux-wireless@vger.kernel.org; netdev@vger.kernel.org;
> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next] rtw89: Fix potential dereference of the null pointer sta
> 
> Pkshih <pkshih@realtek.com> writes:
> 
> >> -----Original Message-----
> >> From: Colin King <colin.king@canonical.com>
> >> Sent: Friday, October 15, 2021 11:46 PM
> >> To: Kalle Valo <kvalo@codeaurora.org>; David S . Miller <davem@davemloft.net>; Jakub Kicinski
> >> <kuba@kernel.org>; Pkshih <pkshih@realtek.com>; linux-wireless@vger.kernel.org;
> >> netdev@vger.kernel.org
> >> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> >> Subject: [PATCH][next] rtw89: Fix potential dereference of the null pointer sta
> >>
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The pointer rtwsta is dereferencing pointer sta before sta is
> >> being null checked, so there is a potential null pointer deference
> >> issue that may occur. Fix this by only assigning rtwsta after sta
> >> has been null checked. Add in a null pointer check on rtwsta before
> >> dereferencing it too.
> >>
> >> Fixes: e3ec7017f6a2 ("rtw89: add Realtek 802.11ax driver")
> >> Addresses-Coverity: ("Dereference before null check")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  drivers/net/wireless/realtek/rtw89/core.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/realtek/rtw89/core.c
> >> b/drivers/net/wireless/realtek/rtw89/core.c
> >> index 06fb6e5b1b37..26f52a25f545 100644
> >> --- a/drivers/net/wireless/realtek/rtw89/core.c
> >> +++ b/drivers/net/wireless/realtek/rtw89/core.c
> >> @@ -1534,9 +1534,14 @@ static bool rtw89_core_txq_agg_wait(struct rtw89_dev *rtwdev,
> >>  {
> >>  	struct rtw89_txq *rtwtxq = (struct rtw89_txq *)txq->drv_priv;
> >>  	struct ieee80211_sta *sta = txq->sta;
> >> -	struct rtw89_sta *rtwsta = (struct rtw89_sta *)sta->drv_priv;
> >
> > 'sta->drv_priv' is only a pointer, we don't really dereference the
> > data right here, so I think this is safe. More, compiler can optimize
> > this instruction that reorder it to the place just right before using.
> > So, it seems like a false alarm.
> >
> >> +	struct rtw89_sta *rtwsta;
> >>
> >> -	if (!sta || rtwsta->max_agg_wait <= 0)
> >> +	if (!sta)
> >> +		return false;
> >> +	rtwsta = (struct rtw89_sta *)sta->drv_priv;
> >> +	if (!rtwsta)
> >> +		return false;
> >> +	if (rtwsta->max_agg_wait <= 0)
> >>  		return false;
> >>
> >>  	if (rtwdev->stats.tx_tfc_lv <= RTW89_TFC_MID)
> >
> > I check the size of object files before/after this patch, and
> > the original one is smaller.
> >
> >    text    data     bss     dec     hex filename
> >   16781    3392       1   20174    4ece core-0.o  // original
> >   16819    3392       1   20212    4ef4 core-1.o  // after this patch
> >
> > Do you think it is worth to apply this patch?
> 
> I think that we should apply the patch. Even though the compiler _may_
> reorder the code, it might choose not to do that.

Understand.

I have another way to fix this coverity warning, like:

@@ -1617,7 +1617,7 @@ static bool rtw89_core_txq_agg_wait(struct rtw89_dev *rtwdev,
 {
        struct rtw89_txq *rtwtxq = (struct rtw89_txq *)txq->drv_priv;
        struct ieee80211_sta *sta = txq->sta;
-       struct rtw89_sta *rtwsta = (struct rtw89_sta *)sta->drv_priv;
+       struct rtw89_sta *rtwsta = sta ? (struct rtw89_sta *)sta->drv_priv : NULL;

        if (!sta || rtwsta->max_agg_wait <= 0)
                return false;

Is this acceptable?
It has a little redundant checking of 'sta', but the code looks clean.

> 
> Another question is that can txq->sta really be null? I didn't check the
> code, but if it should be always set when the null check is not needed.
> 

It says

* struct ieee80211_txq - Software intermediate tx queue
* @sta: station table entry, %NULL for per-vif queue

So, we need to check if 'sta' is NULL.

--
Ping-Ke

