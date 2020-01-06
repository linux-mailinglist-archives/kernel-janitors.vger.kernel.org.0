Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB65130F0C
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 Jan 2020 10:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgAFI7q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 Jan 2020 03:59:46 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34664 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgAFI7q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Jan 2020 03:59:46 -0500
Received: by mail-wm1-f68.google.com with SMTP id c127so11493950wme.1
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Jan 2020 00:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/ZwyOis6F3QKO9vpXF7tA9K3dMi7rhKdiD8Hhm+STvI=;
        b=Y6yD6Dl8fSrpCiMi6JFctDAcHcLCWwV4WbimfBvj3+DL9Ty8MfYj5w1Jus52QpCEJl
         nlmHxj+yyP4MtkOxKVVgDe7K2MPPf5cMrUjhsM8svB3s9M6RYkSINppYo2FslFGuSox8
         fRb6bdg9iqcq0j5GEsidiFjyXNfdXtYqabeDILKYHaPmBhD9Ipydv3If5LV3nXeNKcdt
         EPO/FkJ9ZXJjNjxHdfr3Pz1/8pLLlOaGP+EuBz1Mv/SqE9k816wR/Ss6b7WH5sY734FS
         d3wOMe/FAYyhHeGbZ+9XsFeKMFPxdF9RJ42+wHli+mv5DlaM7u7YwKnLlejHmga0BPn8
         Qf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/ZwyOis6F3QKO9vpXF7tA9K3dMi7rhKdiD8Hhm+STvI=;
        b=hg0xd8JhpvyW38wa+nK02v8CBOdQZ33QYMyoaJF0nQod3HeUixWJ1S+V+yoCLlsUa9
         BUXhg/p372ecR8GsMw0TmjULc4xk+n8JxmbuJNh9gzu+tv4oZmHCdkKkWNfkP7qgQN/K
         zE7r61lBaQBAmhzI6PY3kMSnQGnsQ0uhoc6ZGLQuuBE+e6wxZG0dNapHBZ2RPHrL9Tkt
         XhYM5VL1gM/aJdkmRsnubY8lnCdTzFSMj+kzQ/K1jy49AYQ4ueVZ0JtldJjoEoJd1XUI
         bvUc+SZr+S/ZBaJPxZSauIMdT4pddQWA7qqBK+x+2oLA8bFCgMdV3sAwM2248A2YCB9B
         IjXQ==
X-Gm-Message-State: APjAAAVoFBvIevSwAWctgRKlXlNcm3bSJMjK5I+KfgwXIDD9YC10nNuH
        0jsCajQzte7KQPQeaiFgwQqajA==
X-Google-Smtp-Source: APXvYqxF9x2VCzl/gJXkRc4d1WJjn/hIPNpdwO3oQ7KKNlfk2KXb1uw38kE6ewg/kcMvECWhpHrbPA==
X-Received: by 2002:a05:600c:2551:: with SMTP id e17mr2841233wma.26.1578301184153;
        Mon, 06 Jan 2020 00:59:44 -0800 (PST)
Received: from netronome.com ([2001:982:756:703:d63d:7eff:fe99:ac9d])
        by smtp.gmail.com with ESMTPSA id x11sm73880628wre.68.2020.01.06.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:59:44 -0800 (PST)
Date:   Mon, 6 Jan 2020 09:59:43 +0100
From:   Simon Horman <simon.horman@netronome.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net,
        osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gtp: simplify error handling code in 'gtp_encap_enable()'
Message-ID: <20200106085943.GB10460@netronome.com>
References: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jan 05, 2020 at 06:36:07PM +0100, Christophe JAILLET wrote:
> 'gtp_encap_disable_sock(sk)' handles the case where sk is NULL, so there
> is no need to test it before calling the function.
> 
> This saves a few line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <simon.horman@netronome.com>
