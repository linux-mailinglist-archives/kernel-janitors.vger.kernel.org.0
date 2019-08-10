Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B1588AB6
	for <lists+kernel-janitors@lfdr.de>; Sat, 10 Aug 2019 12:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfHJKUe (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 10 Aug 2019 06:20:34 -0400
Received: from ozlabs.org ([203.11.71.1]:41045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbfHJKUd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Aug 2019 06:20:33 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 465J5q1gVcz9sNf; Sat, 10 Aug 2019 20:20:31 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 2705ec100b46390851542fa97e920cc21ffaac4f
In-Reply-To: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        benh@kernel.crashing.org, paulus@samba.org, allison@lohutok.net,
        tglx@linutronix.de, clg@kaod.org, groug@kaod.org
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in 'xive_irq_bitmap_add()'
Message-Id: <465J5q1gVcz9sNf@ozlabs.org>
Date:   Sat, 10 Aug 2019 20:20:31 +1000 (AEST)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2019-08-01 at 08:32:31 UTC, Christophe JAILLET wrote:
> There is no need to use GFP_ATOMIC here. GFP_KERNEL should be enough.
> GFP_KERNEL is also already used for another allocation just a few lines
> below.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2705ec100b46390851542fa97e920cc21ffaac4f

cheers
