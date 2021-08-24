Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA09E3F5F7F
	for <lists+kernel-janitors@lfdr.de>; Tue, 24 Aug 2021 15:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237582AbhHXNwb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 24 Aug 2021 09:52:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237606AbhHXNw3 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 09:52:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36945610CD;
        Tue, 24 Aug 2021 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629813105;
        bh=fT4icxe7vl+OjEateR7Bqj/zFi8gPwxUTWuXXNQUUr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U6tmW9Kh2WIOoWeBCdrfq5K7Syp78FCpKkfcczRbwtc+PKU4ZbeG4LUNO6CsWo37m
         sF3nl8K3wvYtDlK5/MmWeGmHByyjyY/Gvbc80n0zN5pup3ErcP2jxN92JrY6zLSLO6
         3t1wFOX4gAa8a/45PDfiaP+eewKXGuLvBncgser0=
Date:   Tue, 24 Aug 2021 15:43:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] misc: rtsx: switch from 'pci_' to 'dma_' API
Message-ID: <YST3j0xzFcLWpYec@kroah.com>
References: <50eeb23378e04ef99859eb37c88ca2bf9a702b4c.1629698008.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50eeb23378e04ef99859eb37c88ca2bf9a702b4c.1629698008.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 23, 2021 at 07:54:20AM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below.

That explains nothing about why this is needed :(
