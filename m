Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71B527FC12
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Oct 2020 10:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731895AbgJAI4z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Oct 2020 04:56:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731885AbgJAI4u (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Oct 2020 04:56:50 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F09B20B1F;
        Thu,  1 Oct 2020 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601542609;
        bh=+J+qcQm1lylyAZj+XzZr4MSDB+AbjdvfaTxhoz7fEV0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H+R048pzi27LF30Xg+VMXG6eoTkCkZicDUvSYvFPl8Zbvf8S4lTEIidwYFJ6vt6Qz
         vXyYNfd4p89PTgO32X4jQi+pgznVI/vYqBQRbc38aZrYlrCSUhXdyPRUOXLc06IN/j
         7G+ehx7ExGqhtI9oyAotdN3IhJR1a4zL9QoMykmA=
Date:   Thu, 1 Oct 2020 10:56:50 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>,
        Marcelo Diop-Gonzalez <marcgonzalez@google.com>,
        kernel-janitors@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Jamal Shareef <jamal.k.shareef@gmail.com>
Subject: Re: [PATCH] staging: vchiq: Fix list_for_each exit tests
Message-ID: <20201001085650.GA1832570@kroah.com>
References: <20200928091103.GC377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928091103.GC377727@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Sep 28, 2020 at 12:11:03PM +0300, Dan Carpenter wrote:
> This code code here used to be list_for_each() and after the loop then
> the "entry" pointer was non-NULL if we found the correct entry or NULL
> if we couldn't find it.  Then we changed the code to use list_for_each_entry()
> and so now the "entry" pointer is always non-NULL when we exit the loop.
> 
> I have introduced a new "found" variable to say if we found the correct
> enty or not.  I fixed one test by making it an else statement because
> that was more readable than testing "if (!found)".
> 
> Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when accessing bulk_waiter_list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

This doesn't apply against my tree, what branch did you make it against?

thanks,

greg k-h
