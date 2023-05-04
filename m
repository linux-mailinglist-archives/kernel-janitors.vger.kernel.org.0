Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A0B6F6970
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 May 2023 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjEDLEA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 May 2023 07:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjEDLD5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 07:03:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC7359CA
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 04:03:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA1C1617C6
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 11:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A4BC433EF;
        Thu,  4 May 2023 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683198189;
        bh=FLtRpPUIYy+J9Zu770JjECMBsX3Dt02/FyopoTXBvIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ih836aWXfnTMepbV601cDnhFpRNg04rdAiZMTyjxx6uX+++kvNEOCQ5ltZADJlW3C
         gNQPhbmMWHAgwg7HRWPnis1taFaAM6LeGTkSTDV1O+8o9DwKxQsSAxrcwkwZPw9vjG
         PKVWjNacuB+w2Owe9uaLmgBzzX7xtDcQm4GjyiM2zxbJG4va7OABt99CiDcEx0wG/f
         ACoFObw5ziWMKaET4K9NJ/idSSafWCeAn3gP48OQWGjUxI47jVscjrfSWcz+brUtJU
         sdf2t/oa69QDiHf8IuS1Xj2FHZQ76wiHRxBJRWb0vMMREzckjh3pSNjOqBbrz7Mk1f
         NnTsYyvI1LPNQ==
Date:   Thu, 4 May 2023 14:03:04 +0300
From:   Leon Romanovsky <leon@kernel.org>
To:     wuych <yunchuan@nfschina.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, irusskikh@marvell.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] atlantic: Remove unnecessary (void*) conversions
Message-ID: <20230504110304.GX525452@unreal>
References: <20230504100253.74932-1-yunchuan@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504100253.74932-1-yunchuan@nfschina.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 04, 2023 at 06:02:53PM +0800, wuych wrote:
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>
> ---
>  .../net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

There is same thing in drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c too.

Thanks
