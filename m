Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDDD2CEB55
	for <lists+kernel-janitors@lfdr.de>; Fri,  4 Dec 2020 10:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387737AbgLDJsk (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 4 Dec 2020 04:48:40 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46802 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387601AbgLDJsk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Dec 2020 04:48:40 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id EB5F43B16AC
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Dec 2020 09:47:57 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 59ED0FF811;
        Fri,  4 Dec 2020 09:46:55 +0000 (UTC)
Message-ID: <9d9568fe9e1d5c00eab345c212ad0fa8cbcbc350.camel@hadess.net>
Subject: Re: [PATCH] USB: apple-mfi-fastcharge: Fix use after free in probe
From:   Bastien Nocera <hadess@hadess.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Lucas Tanure <tanure@linux.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Fri, 04 Dec 2020 10:46:54 +0100
In-Reply-To: <X8ik4j8yJitVUyfU@mwanda>
References: <X8ik4j8yJitVUyfU@mwanda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2020-12-03 at 11:42 +0300, Dan Carpenter wrote:
> This code frees "mfi" and then derefences it on the next line to get
> the error code.
> 
> Fixes: b0eec52fbe63 ("USB: apple-mfi-fastcharge: Fix kfree after
> failed kzalloc")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching that.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

