Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F6F1B1A23
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Apr 2020 01:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgDTX1Y (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Apr 2020 19:27:24 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:43480 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgDTX1Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Apr 2020 19:27:24 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6817E1278DA7D;
        Mon, 20 Apr 2020 16:27:23 -0700 (PDT)
Date:   Mon, 20 Apr 2020 16:27:22 -0700 (PDT)
Message-Id: <20200420.162722.800987965200951418.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ipv4: remove redundant assignment to variable rc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200420215149.98490-1-colin.king@canonical.com>
References: <20200420215149.98490-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 20 Apr 2020 16:27:23 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 22:51:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
