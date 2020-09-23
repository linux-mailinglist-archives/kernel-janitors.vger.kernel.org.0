Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B1627550F
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Sep 2020 12:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIWKFE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Sep 2020 06:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIWKFD (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Sep 2020 06:05:03 -0400
Received: from localhost (unknown [122.171.175.143])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CF3A2076E;
        Wed, 23 Sep 2020 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600855503;
        bh=DE1HC6bZAXC33BhPSJIUP9LjJZr0AuwIVj0yEXHmm9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xmHe9xSMEV5pB89hrTgj1EP5WkwKR+ZiNWJr7T6rKXh2axCnNhkV7Vzbsg1Zea3Ud
         aRCQiE9luiQszMla+TFhNPH7qaLdHFTTJ2eypuN+UQ4KcNl2iXE2ywDEhJ1aGY/0TH
         EvSu8QXo1HcDQQcHw+Sh0tdIFw+H0GOmbOMmz6EU=
Date:   Wed, 23 Sep 2020 15:34:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soundwire: remove an unnecessary NULL check
Message-ID: <20200923100455.GG2968@vkoul-mobl>
References: <20200923083235.GB1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923083235.GB1454948@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23-09-20, 11:32, Dan Carpenter wrote:
> The "bus" pointer isn't NULL so the address to a non-zero offset in
> middle of "bus" cannot be NULL.  Delete the NULL check.

Applied, thanks

-- 
~Vinod
