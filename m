Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7174B6A0898
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 Feb 2023 13:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjBWM2z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 23 Feb 2023 07:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBWM2y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Feb 2023 07:28:54 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A2F42BECD
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Feb 2023 04:28:53 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17919C14;
        Thu, 23 Feb 2023 04:29:36 -0800 (PST)
Received: from e120937-lin (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6155E3F881;
        Thu, 23 Feb 2023 04:28:52 -0800 (PST)
Date:   Thu, 23 Feb 2023 12:28:46 +0000
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: return a literal instead of a
 variable
Message-ID: <Y/dXQ+NSx14lcajo@e120937-lin>
References: <Y/Yx8pOdf8rNhPVe@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/Yx8pOdf8rNhPVe@kili>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 22, 2023 at 06:17:06PM +0300, Dan Carpenter wrote:
> In this context "return scmi_dev;" and "return NULL;" are equivalent
> but it is more readable to return a literal.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 73140b854b31..ac306ca48b07 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -436,7 +436,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
>  	/* Nothing to do. */
>  	if (!phead) {
>  		mutex_unlock(&scmi_requested_devices_mtx);
> -		return scmi_dev;
> +		return NULL;
>  	}
>  
>  	/* Walk the list of requested devices for protocol and create them */

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
