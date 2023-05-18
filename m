Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64FF707B5A
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 May 2023 09:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjERHuC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 May 2023 03:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjERHuB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 03:50:01 -0400
Received: from mx-8.mail.web4u.cz (smtp7.web4u.cz [81.91.87.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0310B2690;
        Thu, 18 May 2023 00:49:59 -0700 (PDT)
Received: from mx-8.mail.web4u.cz (localhost [IPv6:::1])
        by mx-8.mail.web4u.cz (Postfix) with ESMTP id 7630C1FF4E0;
        Thu, 18 May 2023 09:32:39 +0200 (CEST)
Received: from baree.pikron.com (unknown [89.103.131.245])
        (Authenticated sender: ppisa@pikron.com)
        by mx-8.mail.web4u.cz (Postfix) with ESMTPA id 2D4981FF4D8;
        Thu, 18 May 2023 09:32:39 +0200 (CEST)
From:   Pavel Pisa <pisa@cmp.felk.cvut.cz>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] can: ctucanfd: Remove a useless netif_napi_del() call
Date:   Thu, 18 May 2023 09:32:38 +0200
User-Agent: KMail/1.9.10
Cc:     Ondrej Ille <ondrej.ille@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        "Marc Kleine-Budde" <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org
References: <58500052a6740806e8af199ece45e97cb5eeb1b8.1684393811.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <58500052a6740806e8af199ece45e97cb5eeb1b8.1684393811.git.christophe.jaillet@wanadoo.fr>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202305180932.38815.pisa@cmp.felk.cvut.cz>
X-W4U-Auth: 59c178831a6430d3fd87e564e9d84dd1bf4afcea
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear Christophe,

On Thursday 18 of May 2023 09:10:39 Christophe JAILLET wrote:
> free_candev() already calls netif_napi_del(), so there is no need to call
> it explicitly. It is harmless, but useless.
>
> This makes the code mode consistent with the error handling path of
> ctucan_probe_common().

OK, but I would suggest to consider to keep sequence in sync with

linux/drivers/net/can/ctucanfd/ctucanfd_pci.c

where is netif_napi_del() used as well

        while ((priv = list_first_entry_or_null(&bdata->ndev_list_head, struct ctucan_priv,
                                                peers_on_pdev)) != NULL) {
                ndev = priv->can.dev;

                unregister_candev(ndev);

                netif_napi_del(&priv->napi);

                list_del_init(&priv->peers_on_pdev);
                free_candev(ndev);
        }

On the other hand, if interrupt can be called for device between
unregister_candev() and free_candev() or some other callback
which is prevented by netif_napi_del() now then I would consider
to keep explicit netif_napi_del() to ensure that no callback
is activated to driver there. And for PCI integration it is more
critical because list_del_init(&priv->peers_on_pdev); appears in
between and I would prefer that no interrupt appears when instance
is not on the peers list anymore. Even that would not be a problem
for actual CTU CAN FD implementation, peers are accessed only during
physical device remove, but I have worked on other controllers
in past, which required to coordinate with peers in interrupt
handling...

So I would be happy for some feedback what is actual guarantee
when device is stopped.

May it be that it would be even more robust to run removal
with two loop where the first one calls unregister_candev()
and netif_napi_del() and only the second one removes from peers
and call free_candev()... But I am not sure there and it is not
problem in actual driver because peers are not used in any
other place...

> While at it, remove a wrong comment about the return value of this
> function.

OK, this has been caused probably by prototype change.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The comment went wrong after 45413bf75919 ("can: ctucanfd: Convert to
> platform remove callback returning void") ---
>  drivers/net/can/ctucanfd/ctucanfd_platform.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/net/can/ctucanfd/ctucanfd_platform.c
> b/drivers/net/can/ctucanfd/ctucanfd_platform.c index
> 55bb10b157b4..8fe224b8dac0 100644
> --- a/drivers/net/can/ctucanfd/ctucanfd_platform.c
> +++ b/drivers/net/can/ctucanfd/ctucanfd_platform.c
> @@ -84,7 +84,6 @@ static int ctucan_platform_probe(struct platform_device
> *pdev) * @pdev:	Handle to the platform device structure
>   *
>   * This function frees all the resources allocated to the device.
> - * Return: 0 always
>   */
>  static void ctucan_platform_remove(struct platform_device *pdev)
>  {
> @@ -95,7 +94,6 @@ static void ctucan_platform_remove(struct platform_device
> *pdev)
>
>  	unregister_candev(ndev);
>  	pm_runtime_disable(&pdev->dev);
> -	netif_napi_del(&priv->napi);
>  	free_candev(ndev);
>  }

Best wishes,

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home
