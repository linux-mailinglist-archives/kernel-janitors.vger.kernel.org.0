Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220B0716DBF
	for <lists+kernel-janitors@lfdr.de>; Tue, 30 May 2023 21:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbjE3Tjx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 30 May 2023 15:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjE3Tju (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 15:39:50 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A60FC9;
        Tue, 30 May 2023 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vuH9AirNJ0G92dOvzMEbbxP5J8VYMBS61Gic4A50dWU=; b=fjiDg0sb9u5hx80DnTUTzrtFvh
        FunR2nQKkBxNVCx47Ok59SmaNZ5O8epfbPFMSFrT4cPE7dDxgjCAyH4kGcTjqvss4dce3ATHdUSo0
        QCKwWYsOMHILt2EFsN51FV8WdMKrTMkD+O+l6YROQuwXrO7ONtZBF3fRNTC2eZP0DXbAugojXFeU8
        BK/pufaAT++ZGpoKAsSx8AzcHOVW8fTQABopPUNu5HM9a9oOkffNFmm1QBsb+QDJObtPiBdnTniWB
        cIVoV0N9YjFotBr7pxcZjXV6ye73E082k8Qn91huCTe9D3O6FMCr/s67Fy/gp9Elt3ZJkmRm83btr
        Cz27DLCg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40238)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q45C1-0003Ms-02; Tue, 30 May 2023 20:39:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q45Bz-0008KW-3w; Tue, 30 May 2023 20:39:39 +0100
Date:   Tue, 30 May 2023 20:39:39 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <ZHZQ+1KNGB7KYZGi@shell.armlinux.org.uk>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
 <90b1107b-7ea0-4d8f-ad88-ec14fd149582@lunn.ch>
 <20230530121910.05b9f837@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530121910.05b9f837@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 30, 2023 at 12:19:10PM -0700, Jakub Kicinski wrote:
> On Tue, 30 May 2023 14:39:53 +0200 Andrew Lunn wrote:
> > > Therefore we should try to fix phy_read_poll_timeout() instead to
> > > use a local variable like it does for __ret.  
> > 
> > The problem with that is val is supposed to be available to the
> > caller. I don't know if it is every actually used, but if it is, using
> > an internal signed variable and then throwing away the sign bit on
> > return is going to result in similar bugs.
> 
> This is what I meant FWIW:
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 7addde5d14c0..829bd57b8794 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1206,10 +1206,13 @@ static inline int phy_read(struct phy_device *phydev, u32 regnum)
>  #define phy_read_poll_timeout(phydev, regnum, val, cond, sleep_us, \
>  				timeout_us, sleep_before_read) \
>  ({ \
> -	int __ret = read_poll_timeout(phy_read, val, val < 0 || (cond), \
> +	int __ret, __val;						\
> +									\
> +	__ret = read_poll_timeout(phy_read, __val, __val < 0 || (cond),	\
>  		sleep_us, timeout_us, sleep_before_read, phydev, regnum); \
> -	if (val < 0) \
> -		__ret = val; \
> +	val = __val;
> +	if (__val < 0) \
> +		__ret = __val; \
>  	if (__ret) \
>  		phydev_err(phydev, "%s failed: %d\n", __func__, __ret); \
>  	__ret; \
> 
> 
> I tried enabling -Wtype-limits but it's _very_ noisy :(

Yes, looks good, that's what I thought you were meaning, and I totally
agree with it. Thanks!

Whatever we decide for this will also need to be applied to
phy_read_mmd_poll_timeout() as well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
